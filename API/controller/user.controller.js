const UserModel = require("../model/user.model");
const UserService = require("../services/user.services");
const db = require('../config/db');

exports.register = async(req,res,next)=>{
    try{
        
        const {mobile_number,name,faculty,address,password} = req.body;
        
        if (!mobile_number || !name || !faculty || !address || !password) {
            return res.status(400).send({ error: 'All fields are required' });
        }

        const successRes = await UserService.register(mobile_number,name,faculty,address,password);

        res.json({status:true, success:"User Registered Successfully"});
        
    }catch(error){
        if(error.message === "Mobile Number Already in use"){
            res.status(400).json({status: false, error: error.message});
        }else{
            throw(error);
        }
    }
}

exports.login = async(req,res,next)=>{
    try {
        const {mobile_number,password} = req.body;

        const user = await UserService.checkuser(mobile_number);

        if(!user){
            return res.status(400).json({status:false, error: 'User does not exist'});
        }

        const isMatch = await user.comparePassword(password);

        if(isMatch === false){
            return res.status(400).json({status: false, error:"Password Invalid"});
        }

        let tokenData = {_id:user._id, mobile_number:user.mobile_number};

        const token = await UserService.genarateToken(tokenData,"secretKey",'1h');

        res.json({status:true, token:token});
    } catch(error){
        next(error);
    }
}

exports.getmenu = async (req,res)=>{
    try{
        const collection = db.collection('menu');
        const menu = await collection.find({}).toArray();
        res.status(200).json(menu);
    } catch(error){
        res.status(500).json({message: 'Error fetching menu details', error: error});
    }
};


exports.placeorder = async(req,res,next)=>{
    try{
        
        const {mobile_number,total,veg_count,veg_price,egg_count,egg_price,chicken_count,chicken_price,rice_count,rice_price,kottu_count,kottu_price,fish_count,fish_price} = req.body;
        
        const successRes = await UserService.placeorder(mobile_number,total,veg_count,veg_price,egg_count,egg_price,chicken_count,chicken_price,rice_count,rice_price,kottu_count,kottu_price,fish_count,fish_price);

        res.json({status:true, success:"Order placed Successfully"});
        
    }catch(error){    

        throw(error);
    }
}

exports.getprodetails = async (req,res)=>{
    try{
        const {mobile_number} = req.body;

        const collection = db.collection('users');
        const user = await collection.findOne({mobile_number: mobile_number});
        if (!user) {
            return res.status(404).json({ message: 'User not found' });
          }
        res.status(200).json(user);
    } catch(error){
        res.status(500).json({message: 'Error fetching menu details', error: error});
    }
};


exports.getuserorders = async (req,res)=>{
    try{
        const {mobile_number} = req.body;
        
        const collection = db.collection('orders');
        const orders = await collection.find({mobile_number: mobile_number}).toArray();
        res.status(200).json(orders);
    } catch(error){
        res.status(500).json({message: 'Error fetching menu details', error: error});
    }
};

exports.adminlogin = async(req,res,next)=>{
    try {
        const {username,password} = req.body;

        const user = await UserService.admincheckuser(username);

        if(!user){
            return res.status(400).json({status:false, error: 'User does not exist'});
        }

        const isMatch = await user.comparePassword(password);

        if(isMatch === false){
            return res.status(400).json({status: false, error:"Password Invalid"});
        }

        let tokenData = {_id:user._id, username:user.username};

        const token = await UserService.genarateToken(tokenData,"secretKey",'1h');

        res.json({status:true, token:token});
    } catch(error){
        next(error);
    }
}

exports.getusers = async (req,res)=>{
    try{
        const collection = db.collection('users');
        const menu = await collection.find({}).toArray();
        res.status(200).json(menu);
    } catch(error){
        res.status(500).json({message: 'Error fetching menu details', error: error});
    }
};

exports.removeuser = async (req, res) => {
    try {
        const { mobile_number } = req.body;

        if (!mobile_number) {
            return res.status(400).json({ status: false, error: 'Mobile number is required' });
        }

        const collection = db.collection('users');
        const result = await collection.deleteOne({ mobile_number: mobile_number });

        if (result.deletedCount === 0) {
            return res.status(404).json({ status: false, error: 'User not found' });
        }

        res.status(200).json({ status: true, success: 'User deleted successfully' });
    } catch (error) {
        res.status(500).json({ status: false, error: 'Error deleting user', details: error });
    }
};
