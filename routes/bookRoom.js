const express = require('express');
const db = require('../models/db');
const router = express.Router();

router.get('/', function (req, res, next) {
    let sql = `SELECT * FROM book_room`;
    db.query(sql, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);
    });
});
router.post('/order', function (req, res, next) {
    let bookRoom = {
        roomCode: req.body.roomCode,
        arrivalDay: req.body.arrivalDay,
        dayOut: req.body.dayOut,
        theNumberGuests: req.body.theNumberGuests,
        userCode: req.body.userCode,
    };
    let sql = `INSERT INTO book_room SET ?`;
    db.query(sql, bookRoom, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Đặt phòng thành công' });
    });
});
router.post('/editBookingRoom', function (req, res, next) {
    let id = req.body.roomCode;
    let arrivalDay1 = req.body.arrivalDay;
    let dayOut1 = req.body.dayOut;
    let theNumberGuests1 = req.body.theNumberGuests;
    let form__booking = {
        arrivalDay: arrivalDay1,
        dayOut: dayOut1,
        theNumberGuests: theNumberGuests1,
    };
    console.log(id);
    console.log(form__booking);
    let sql = `UPDATE book_room SET ? WHERE roomCode = ?`;
    db.query(sql, [form__booking, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Edit booking successfully' });
    });
});
router.post('/blockBookingRoom', function (req, res, next) {
    let id = req.body.id;
    let sta = req.body.status
    let form__booking = {
        status: sta
    };
    let sql = `UPDATE book_room SET ? WHERE id = ?`;
    db.query(sql, [form__booking, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Block booking successfully' });
    });
});
module.exports = router;
