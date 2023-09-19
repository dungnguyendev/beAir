const express = require('express');
const db = require('../models/db');

    const router = express.Router();

router.get('/', function (req, res, next) {
    let sql = `SELECT * FROM rented_room`;
    db.query(sql, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);
    });
});
router.get('/detail/:id', function (req, res, next) {
    let sql = `SELECT * FROM rented_room WHERE id = ${req.params.id} `;
    db.query(sql, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);
    });
});
router.get('/location/:id', function (req, res, next) {
    let sql = `SELECT * FROM rented_room WHERE locationCode = ${req.params.id} `;
    db.query(sql, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);
    });
});
router.post('/search', function (req, res, next) {
    const searchTerm = req.body.search1;
    const sql = `SELECT * FROM rented_room WHERE roomName LIKE '%${searchTerm}%'`;
    db.query(sql, function (err, results) {
        if (err) {
            console.error('Lỗi truy vấn cơ sở dữ liệu:', err);
            return next(err);
        }
        res.json(results);
    });
});
router.post('/addRoom', function (req, res, next) {
    let codeR = req.body.codeRoom;
    let nameR = req.body.roomName;
    let guest1 = req.body.guest;
    let bedRoom1 = req.body.bedRoom;
    let bed1 = req.body.bed;
    let discription1 = req.body.discription;
    let price1 = req.body.price;
    let washingMachine1 = req.body.washingMachine;
    let iron1 = req.body.iron;
    let tivi1 = req.body.tivi;
    let airConditioner1 = req.body.airConditioner;
    let kitchen1 = req.body.kitchen;
    let parking1 = req.body.parking;
    let wifi1 = req.body.wifi;
    let pool1 = req.body.pool;
    let locationCode1 = req.body.locationCode;
    let image1 = req.body.image;
    let bathroom1 = req.body.bathroom;

    let form__rented = {
        codeRoom: codeR,
        roomName: nameR,
        guest: guest1,
        bedRoom: bedRoom1,
        bed: bed1,
        discription: discription1,
        price: price1,
        washingMachine: washingMachine1,
        iron: iron1,
        tivi: tivi1,
        airConditioner: airConditioner1,
        kitchen: kitchen1,
        parking: parking1,
        wifi: wifi1,
        pool: pool1,
        locationCode: locationCode1,
        image: image1,
        bathroom: bathroom1,
        status: false,
    };
    console.log(form__rented);
    let sql = `INSERT INTO rented_room SET ?`;
    db.query(sql, form__rented, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Create rented room successfully' });
    });
});
router.post('/editRentedRoom', function (req, res, next) {
    let id = req.body.id;
    let nameR = req.body.roomName;
    let guest1 = req.body.guest;
    let bedRoom1 = req.body.bedRoom;
    let bed1 = req.body.bed;
    let discription1 = req.body.discription;
    let price1 = req.body.price;
    let washingMachine1 = req.body.washingMachine;
    let iron1 = req.body.iron;
    let tivi1 = req.body.tivi;
    let airConditioner1 = req.body.airConditioner;
    let kitchen1 = req.body.kitchen;
    let parking1 = req.body.parking;
    let wifi1 = req.body.wifi;
    let pool1 = req.body.pool;
    let locationCode1 = req.body.locationCode;
    let image1 = req.body.image;
    let bathroom1 = req.body.bathroom;

    let form__rented = {
        roomName: nameR,
        guest: guest1,
        bedRoom: bedRoom1,
        bed: bed1,
        discription: discription1,
        price: price1,
        washingMachine: washingMachine1,
        iron: iron1,
        tivi: tivi1,
        airConditioner: airConditioner1,
        kitchen: kitchen1,
        parking: parking1,
        wifi: wifi1,
        pool: pool1,
        locationCode: locationCode1,
        image: image1,
        bathroom: bathroom1,
        status: false,
    };
    let sql = `UPDATE rented_room SET ? WHERE id = ?`;
    db.query(sql, [form__rented, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Edit rented room successfully' });
    });
});
router.post('/blockRentedRoom', function (req, res, next) {
    let id = req.body.id
    let status1 = req.body.status;
    let form__rented = {
        status: status1,
    };
    let sql = `UPDATE rented_room SET ? WHERE id = ?`;
    db.query(sql, [form__rented, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Block rented room successfully' });
    });
});
module.exports = router;
