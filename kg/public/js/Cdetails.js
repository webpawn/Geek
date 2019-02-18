$(function(){
    var $shanping=$(".cadlt a:nth-child(3)");
    // $shanping.click(function(){
    //     console.log("sc");
    // })
    $(".Cat_btn").click(function(){
        var info= $shanping.html();
        if(info.trim().length>0){
        location.href="index.html?kwords="+$shanping.html();
        console.log(location.href);
        }
    });
})