const sequelize = require('../db');
const {DataTypes} = require('sequelize');

const User = sequelize.define('user', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    login: {type: DataTypes.STRING, unique: true, allowNull: false},
    fullname: {type: DataTypes.STRING, unique: true},
    role: {type: DataTypes.STRING, defaultValue: 'USER'},
})

const Cathedra = sequelize.define('cathedra', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, allowNull: false},
    user_name: {type: DataTypes.STRING},
    faculty_id: {type: DataTypes.INTEGER},
    clin_or_teor: {type: DataTypes.STRING},
    cath_type_id: {type: DataTypes.INTEGER},
})

const Item = sequelize.define('item', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, unique: true, allowNull: false},
    num: {type: DataTypes.STRING, unique: true},
    ball: {type: DataTypes.INTEGER},
    help: {type: DataTypes.STRING},
    formula: {type: DataTypes.STRING},
    type: {type: DataTypes.STRING},
    formula_comment: {type: DataTypes.STRING},
    parentId: {type: DataTypes.INTEGER},
})

const Report = sequelize.define('report', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    value: {type: DataTypes.INTEGER},
    ball_value: {type: DataTypes.INTEGER}, //Numeric
    selectvalue: {type: DataTypes.STRING},
    itemId: {type: DataTypes.INTEGER},
    resultId: {type: DataTypes.INTEGER},
})

const Select_name = sequelize.define('select_name', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING},
    select_help: {type: DataTypes.STRING},
    ball: {type: DataTypes.INTEGER},
})

const Result = sequelize.define('result', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    result: {type: DataTypes.INTEGER}, //Numeric
    userId: {type: DataTypes.INTEGER},
})

const Massiv = sequelize.define('massiv', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    value: {type: DataTypes.INTEGER},
    userId: {type: DataTypes.INTEGER},
    itemId: {type: DataTypes.INTEGER},
})

const ReportLocal = sequelize.define('reportlocal', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    value: {type: DataTypes.INTEGER},
    ball_value: {type: DataTypes.INTEGER}, //Numeric
    selectvalue: {type: DataTypes.STRING},
    itemId: {type: DataTypes.INTEGER},
    resultId: {type: DataTypes.INTEGER},
})

const MassivLocal = sequelize.define('massivlocal', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    value: {type: DataTypes.INTEGER},
    userId: {type: DataTypes.INTEGER},
    itemId: {type: DataTypes.INTEGER},
})

const Faculty = sequelize.define('faculty', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, allowNull: false},
})

const Cath_type = sequelize.define('cath_type', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, allowNull: false},
})


Cathedra.hasMany(User);
User.belongsTo(Cathedra);

User.hasOne(Report);
Report.belongsTo(User);

User.hasMany(Item);
Item.belongsTo(User);

Item.hasOne(Report);
Report.belongsTo(Item);

Item.hasMany(Select_name);
Select_name.belongsTo(Item);

Result.hasMany(Report);
Report.belongsTo(Result);

User.hasOne(ReportLocal);
ReportLocal.belongsTo(User);

module.exports = {
    User,
    Item,
    Report,
    Select_name,
    Result,
    Cathedra,
    Massiv,
    ReportLocal,
    MassivLocal,
    Faculty,
    Cath_type
}