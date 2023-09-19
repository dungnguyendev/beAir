const express = require('express');
const db = require('../models/db');
const router = express.Router();

router.get('/', function (req, res, next) {
    let sql = `SELECT * FROM location`;
    db.query(sql, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);
    });
});
router.get('/location/:idLocation', function (req, res, next) {
    let sql = `SELECT * FROM location WHERE id = ${req.params.idLocation}`;
    db.query(sql, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);
    });
});
router.post('/search', function (req, res, next) {
    const searchTerm = req.body.search1;
    const sql = `SELECT * FROM location WHERE nameLocation LIKE '%${searchTerm}%'`;
    db.query(sql, function (err, results) {
        if (err) {
            console.error('Lỗi truy vấn cơ sở dữ liệu:', err);
            return next(err);
        }
        res.json(results);
    });
});
router.post('/addLocation', function (req, res, next) {
    let nameLocation1 = req.body.nameLocation;
    let province1 = req.body.province;
    let country1 = req.body.country;
    let image1 = req.body.image;
    let form__addLocation = {
        nameLocation: nameLocation1,
        province: province1,
        country: country1,
        image: image1,
    };
    let sql = `INSERT INTO location SET ?`;
    db.query(sql, form__addLocation, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Create account successfully' });
    });
});
router.post('/editLocation', function (req, res, next) {
    let id = req.body.id;
    let nameLocation1 = req.body.nameLocation;
    let province1 = req.body.province;
    let country1 = req.body.country;
    let image1 = req.body.image;
    let form__editLocation = {
        nameLocation: nameLocation1,
        province: province1,
        country: country1,
        image: image1,
    };
    let sql = `UPDATE location SET ? WHERE id = ?`;
    db.query(sql, [form__editLocation, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Block booking successfully' });
    });
});
router.post('/blockLocation', function (req, res, next) {
    let id = req.body.id;
    let sta = req.body.status;
    let form__booking = {
        status: sta,
    };
    let sql = `UPDATE location SET ? WHERE id = ?`;
    db.query(sql, [form__booking, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Block booking successfully' });
    });
});
module.exports = router;
