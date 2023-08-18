const ApiError = require("../error/ApiError");
const ActiveDirectory = require("activedirectory");
const jwt = require("jsonwebtoken");
const { User } = require("../models/models");
const config = {
  url: process.env.USERS_BASE_URL,
  baseDN: process.env.USERS_BASE_DN,
  username: process.env.DEFAULT_USERNAME,
  password: process.env.DEFAULT_PASSWORD,
};

const generateJwt = (id, login, role, name) => {
  return jwt.sign({ id, login, role, name }, process.env.SECRET_KEY, {
    expiresIn: "24h",
  });
};

async function findName(next, login, role, res) {
  const sAMAccountName = login;

  const ad = new ActiveDirectory(config);
  ad.findUser(sAMAccountName, function (err, user) {
    if (err) {
      console.log("ERROR: " + JSON.stringify(err));
      return next(ApiError.badRequest("Ошибка!"));
    }

    if (!user) {
      console.log("User: " + sAMAccountName + " not found.");
      return next(
        ApiError.badRequest("User: " + sAMAccountName + " not found.")
      );
    } else {
      console.log(JSON.stringify(user.cn));
      const sec = user.cn;
      end(login, role, sec, res);
    }
  });
}

async function end(login, role, sec, res) {
  const user = await User.create({ login, role, fullname: sec });
  const token = generateJwt(user.id, user.login, user.role, user.fullname);
  return res.json({ token });
}

async function createAdm(login, role, res, next) {
  const candidate = await User.findOne({ where: { login } });
  if (candidate) {
    console.log("Authenticated!");
    const token = generateJwt(candidate.id, candidate.login, candidate.role, candidate.fullname);
    return res.json({ token });
  } else {
    console.log("Authenticated!");
    findName(next, login, role, res);
  }
}

class UserController {
  async login(req, res, next) {
    console.log(req.body);
    const { login, password, role } = req.body;
    if (!login || !password) {
      return next(ApiError.badRequest("Некорректный логин или пароль!"));
    }
    const ad = new ActiveDirectory(config);
    ad.authenticate(login, password, function (err, auth) {
      if (err) {
        console.log("ERROR: " + JSON.stringify(err));
        return next(ApiError.badRequest("Ошибка! Неправильный пароль..."));
      }
      if (auth) {
        createAdm(login, role, res, next);
      } else {
        console.log("Authentication failed!");
        return next(ApiError.badRequest("Непредвиденная ошибка..."));
      }
    });
  }

  async check(req, res) {
    const token = generateJwt(req.user.id, req.user.login, req.user.role, req.user.fullname);
    return res.json({ token });
  }

  async update(req, res, next) {
    try {
        const id = req.params.id;
        const user = req.body;
        if (!user.id) {
            res.status(400).json( {message: 'Id не указан'});
        }
        const updatedUser = await User.update(user, {
            where: {id: id},
        })
        
        return res.json(updatedUser);
    } catch(e) {
        
        next(ApiError.badRequest(e.message));
    }
}

async getOne(req, res) {
  const {id} = req.params;
  const user = await User.findOne({
      where: {id}
  })
  return res.json(user);
}

async find(req, res, next) {
  try {
    const { id } = req.params;
    //console.log(req.params);
    if (!id) {
      res.status(400).json({ message: "Id не указан" });
    }
    const users = await User.findAll({
      where: { cathedraId: id },
    });
    return res.json(users);
  } catch (e) {
    next(ApiError.badRequest(e.message));
  }
}

async findAdmins(req, res, next) {
 
    const admins = await User.findAll();
    return res.json(admins);
}

}

module.exports = new UserController();
