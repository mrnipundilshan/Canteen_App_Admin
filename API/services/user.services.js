const UserModel = require('../model/user.model');
const OrderModel = require('../model/order.model');
const AdminModel = require('../model/admin.model');
const jwt = require('jsonwebtoken');

class UserService{
    static async register(mobile_number,name,faculty,address,password){
        try{
            const createUser = new UserModel({mobile_number,name,faculty,address,password});
            return await createUser.save();
        }catch(error){
            if(error.code === 11000){
                throw new Error('Mobile Number Already in use');
            }
            throw error;
        }
    }

    static async checkuser(username){
        try{
            return await AdminModel.findOne({username});
        } catch(error){
            throw error
        }
    }

    static async genarateToken(tokenData, secretKey,jwt_expire){
        return jwt.sign(tokenData,secretKey,{expiresIn:jwt_expire})
    }

    

}

module.exports = UserService;