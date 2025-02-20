const UserModel = require("../model/user.model");
const UserService = require("../services/user.services");
const db = require('../config/db');
const { ObjectId } = require('mongodb');

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



exports.removeorder = async (req, res) => {
    try {
        const {_id} = req.body;

        if (!_id) {
            return res.status(400).json({ status: false, error: 'Order is required' });
        }
        console.log(_id);
        const collection = db.collection('orders');
        const result = await collection.deleteOne({ _id: new ObjectId(_id) });

        if (result.deletedCount === 0) {
            return res.status(404).json({ status: false, error: 'Order not found' });
        }

        res.status(200).json({ status: true, success: 'Order deleted successfully' });
    } catch (error) {
        console.error("Error details:", error); 
        res.status(500).json({ status: false, error: 'Error deleting Order', details: error });
    }
};

exports.updatefoodlist = async(req, res) => {
    try {
        const { vegischeck, fishischeck, chickenischeck, eggischeck, kottuischeck, riceischeck } = req.body;

        const foodItems = [
            { name: 'Veg', visible: vegischeck },
            { name: 'Fish', visible: fishischeck },
            { name: 'Chicken', visible: chickenischeck },
            { name: 'Egg', visible: eggischeck },
            { name: 'Kottu', visible: kottuischeck },
            { name: 'Rice', visible: riceischeck }
        ];

        const collection = db.collection('menu');

        for (const item of foodItems) {
            await collection.updateOne(
                { name: item.name },
                { $set: { visible: item.visible } }
            );
        }

        res.status(200).json({ status: true, success: "Food visibility updated successfully" });
    } catch (error) {
        res.status(500).json({ status: false, error: 'Error updating food visibility', details: error });
    }
};

exports.getorders = async (req,res)=>{
    try{
        const collection = db.collection('orders');
        const orders = await collection.find({}).toArray();
        res.status(200).json(orders);
    } catch(error){
        res.status(500).json({message: 'Error fetching menu details', error: error});
    }
};

exports.moveorders = async (req,res) =>{
    try{
        const { _id } = req.body;

        if(!_id){
            return res.status(400).json({status: false, error: 'Order id is required'});
        }

        const ordersCollection = db.collection('orders');
        const deliverCollection = db.collection('deliver');

        const order = await ordersCollection.findOne({_id: new ObjectId(_id)});

        if (!order) {
            return res.status(404).json({ status: false, error: 'Order not found' });
        }

        await deliverCollection.insertOne(order);

        await ordersCollection.deleteOne({_id: new ObjectId(_id)});

        res.status(200).json({ status: true, success: 'Order moved to deliver collection successfully' });
    } catch (error) {
        console.error("Error details:", error);
        res.status(500).json({ status: false, error: 'Error moving order to deliver collection', details: error });
    }
}

exports.getdelivers = async (req,res)=>{
    try{
        const collection = db.collection('deliver');
        const orders = await collection.find({}).toArray();
        res.status(200).json(orders);
    } catch(error){
        res.status(500).json({message: 'Error fetching menu details', error: error});
    }
};

exports.getoverview = async (req, res) => {
    try {
        const collection = db.collection('orders');

        const result = await collection.aggregate([
            {
                $group: {
                    _id: null,
                    totalVegCount: { $sum: "$veg_count" },
                    totalEggCount: { $sum: "$egg_count" },
                    totalChickenCount: { $sum: "$chicken_count" },
                    totalRiceCount: { $sum: "$rice_count" },
                    totalKottuCount: { $sum: "$kottu_count" },
                    totalFishCount: { $sum: "$fish_count" },
                    vegPrice: { $first: "$veg_price" },
                    eggPrice: { $first: "$egg_price" },
                    chickenPrice: { $first: "$chicken_price" },
                    ricePrice: { $first: "$rice_price" },
                    kottuPrice: { $first: "$kottu_price" },
                    fishPrice: { $first: "$fish_price" }
                }
            }
        ]).toArray();

        const response = result.length > 0 ? result[0] : {
            totalVegCount: 0,
            vegPrice: 0,
            totalEggCount: 0,
            eggPrice: 0,
            totalChickenCount: 0,
            chickenPrice: 0,
            totalRiceCount: 0,
            ricePrice: 0,
            totalKottuCount: 0,
            kottuPrice: 0,
            totalFishCount: 0,
            fishPrice: 0
        };

        res.status(200).json({ status: true, ...response });
    } catch (error) {
        res.status(500).json({ status: false, message: 'Error fetching total food counts and prices', error: error });
    }
};


exports.getdeliveroverview = async (req, res) => {
    try {
        const collection = db.collection('deliver');

        const result = await collection.aggregate([
            {
                $group: {
                    _id: null,
                    totalVegCount: { $sum: "$veg_count" },
                    totalEggCount: { $sum: "$egg_count" },
                    totalChickenCount: { $sum: "$chicken_count" },
                    totalRiceCount: { $sum: "$rice_count" },
                    totalKottuCount: { $sum: "$kottu_count" },
                    totalFishCount: { $sum: "$fish_count" },
                    vegPrice: { $first: "$veg_price" },
                    eggPrice: { $first: "$egg_price" },
                    chickenPrice: { $first: "$chicken_price" },
                    ricePrice: { $first: "$rice_price" },
                    kottuPrice: { $first: "$kottu_price" },
                    fishPrice: { $first: "$fish_price" }
                }
            }
        ]).toArray();

        const response = result.length > 0 ? result[0] : {
            totalVegCount: 0,
            vegPrice: 0,
            totalEggCount: 0,
            eggPrice: 0,
            totalChickenCount: 0,
            chickenPrice: 0,
            totalRiceCount: 0,
            ricePrice: 0,
            totalKottuCount: 0,
            kottuPrice: 0,
            totalFishCount: 0,
            fishPrice: 0
        };

        res.status(200).json({ status: true, ...response });
    } catch (error) {
        res.status(500).json({ status: false, message: 'Error fetching total food counts and prices', error: error });
    }
};

exports.getUserCount = async (req, res) => {
    try {
        const collection = db.collection('users');
        const userCount = await collection.countDocuments();

        res.status(200).json({ status: true, userCount: userCount });
    } catch (error) {
        res.status(500).json({ message: 'Error fetching user count', error: error });
    }
};

