const express = require('express');
const db = require('../models/db');
const router = express.Router();

router.get('/', function (req, res, next) {
    let sql = `SELECT * FROM account`;
    db.query(sql, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json(data);
    });
});
router.post('/register', function (req, res, next) {
    let u = req.body.name;
    let p = req.body.password;
    let e = req.body.email;
    let phoe = req.body.phone;
    const bcrypt = require('bcrypt');
    var salt = bcrypt.genSaltSync(10);
    var pass_mahoa = bcrypt.hashSync(p, salt);
    let user_info = { name: u, password: pass_mahoa, email: e, phone: phoe, birthday: '', role: 0 };
    console.log(user_info);
    let sql = `INSERT INTO account SET ?`;
    db.query(sql, user_info, function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Create account successfully' });
    });
});
router.post('/editUser', function (req, res, next) {
    let id = req.body.id;
    let u = req.body.name;
    // let p = req.body.password;
    let e = req.body.email;
    let phoe = req.body.phone;
    let roleCall = req.body.role;
    let permissionCall = req.body.permission;
    // const bcrypt = require('bcrypt');
    // var salt = bcrypt.genSaltSync(10);
    // var pass_mahoa = bcrypt.hashSync(p, salt);
    let user_info = {
        name: u,
        // password: pass_mahoa,
        email: e,
        phone: phoe,
        birthday: '',
        role: roleCall,
        permission: permissionCall,
    };

    let sql = `UPDATE account SET ? WHERE id = ?`;
    db.query(sql, [user_info, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Edit user successfully' });
    });
});
router.post('/blockUser', function (req, res, next) {
    let id = req.body.id;
    let roleCall = req.body.role;
    let user_info = {
        role: roleCall,
    };
    let sql = `UPDATE account SET ? WHERE id = ?`;
    db.query(sql, [user_info, id], function (err, data) {
        if (err) {
            return next(err);
        }
        res.json({ message: 'Edit user successfully' });
    });
});
router.delete('/deleteUser/:id', function (req, res, next) {
    const id = req.params.id;
    console.log(id);
    // Tiến hành xóa user từ cơ sở dữ liệu dựa vào id
    let sql = `DELETE FROM account WHERE id = ?`;
    db.query(sql, id, function (err, data) {
        if (err) {
            return next(err);
        }
        if (data.affectedRows === 0) {
            return res.status(404).json({ message: 'User not found' });
        }
        res.json({ message: 'Delete user successfully' });
    });
});
router.post('/login', function (req, res) {
    let u = req.body.email;
    let p = req.body.password;
    console.log(req.body);
    let sql = `SELECT * FROM account WHERE email = ?`;
    db.query(sql, u, function (err, data) {
        if (err) {
            return next(err);
        }
        if (data.length === 0) {
            return res.status(404).json({ message: 'Người dùng không tồn tại' });
        }
        const bcrypt = require('bcrypt');
        const passwordMatch = bcrypt.compareSync(p, data[0].password);
        if (!passwordMatch) {
            return res.status(401).json({ message: 'Mật khẩu không đúng' });
        }
        res.json({
            message: 'Đăng nhập thành công',
            name: data[0].name,
            email: data[0].email,
            code: data[0].id,
            permission: data[0].permission
        });
    });
});
module.exports = router;
