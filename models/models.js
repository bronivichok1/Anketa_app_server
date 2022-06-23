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
    user_id: {type: DataTypes.INTEGER},
})

const Item = sequelize.define('item', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, allowNull: false},
    num: {type: DataTypes.STRING, unique: true},
    ball: {type: DataTypes.INTEGER}, //Numeric
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
    cathedra_id: {type: DataTypes.INTEGER}
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
    cathedra_id: {type: DataTypes.INTEGER},
    cath_result_id: {type: DataTypes.INTEGER}

})

const Massiv = sequelize.define('massiv', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    value: {type: DataTypes.INTEGER},
    userId: {type: DataTypes.INTEGER},
    itemId: {type: DataTypes.INTEGER},
    result_id: {type: DataTypes.INTEGER}
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

const CathResult = sequelize.define('cath_result', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    result: {type: DataTypes.INTEGER}, //Numeric
    cathedraId: {type: DataTypes.INTEGER},
})

const CathReport = sequelize.define('cath_report', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    value: {type: DataTypes.INTEGER},
    ball_value: {type: DataTypes.INTEGER}, //Numeric
    selectvalue: {type: DataTypes.STRING},
    itemId: {type: DataTypes.INTEGER},
    colvo: {type: DataTypes.INTEGER},
    cathedraId: {type: DataTypes.INTEGER},
    cath_result_id : {type: DataTypes.INTEGER},
})

const ColvoSelects = sequelize.define('colvo_selects', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    colvo: {type: DataTypes.INTEGER}, 
    select_namesId: {type: DataTypes.INTEGER},
    ball: {type: DataTypes.INTEGER}, 
    cathedra_id: {type: DataTypes.INTEGER},
    cath_result_id : {type: DataTypes.INTEGER},
})

const RatingTables = sequelize.define('rating_tables', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, allowNull: false},
    formula: {type: DataTypes.STRING},
    active: {type: DataTypes.BOOLEAN, defaultValue: true},
})

const Dates = sequelize.define('dates', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    firstDate: {type: DataTypes.STRING, allowNull: false},
    lastDate: {type: DataTypes.STRING, allowNull: false},
})

const Books = sequelize.define('books', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    type: {type: DataTypes.STRING, allowNull: false},
    name: {type: DataTypes.STRING, allowNull: false},
    protocol_num: {type: DataTypes.STRING},
    magaz_or_collection: {type: DataTypes.STRING},
    database: {type: DataTypes.STRING},
    colvo_authors : {type: DataTypes.INTEGER},
    item_id : {type: DataTypes.INTEGER},
    book_report_id : {type: DataTypes.INTEGER},
})

const Authors = sequelize.define('authors', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    name: {type: DataTypes.STRING, allowNull: false},
    books_id : {type: DataTypes.INTEGER},
    book_report_id : {type: DataTypes.INTEGER},
})

const Book_Report = sequelize.define('book_report', {
    id: {type: DataTypes.INTEGER, primaryKey: true, autoIncrement: true},
    cathedra_id : {type: DataTypes.INTEGER},
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
    Cath_type,
    CathResult,
    CathReport,
    ColvoSelects,
    RatingTables,
    Dates,
    Books,
    Authors,
    Book_Report
}