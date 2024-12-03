const getVersion=async(req,res) => {
    return res.status(200).json({
       sucess : true,
       message: 'invoice controller version 1'
    })
};

module.exports=getVersion;
