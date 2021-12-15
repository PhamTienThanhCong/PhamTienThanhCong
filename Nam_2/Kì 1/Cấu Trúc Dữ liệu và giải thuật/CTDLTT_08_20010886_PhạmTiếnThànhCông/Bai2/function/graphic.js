for (var i = 1; i <= 16; i = i * 2) {
    var valuePoint = widthScreen / (i * 2) - widthTree / 2;
    for (var j = 1; j <= i; j++) {
        var fromConect = 0
        if (pointTrees.length > 0){
            fromConect = Math.round(pointTrees.length/2)-1
        }
        var pointTree = {
            top: topTree,
            left: valuePoint,
            conect: fromConect
        }
        pointTrees.push(pointTree);
        valuePoint = valuePoint + widthScreen / i;
    }
    topTree = topTree + 80
}
// ramdomValue()

function createArrow(){
    if(document.getElementById("mainShowValue")){
        resetAllTree()
    }
    local = []
    
    for (var i = 0; i < valueInputSort.length; i++) {
        var a = document.createElement("div");
        a.className = "childHidden";
        a.style.top = pointTrees[i].top + "px";
        a.style.left = pointTrees[i].left + "px";
        a.id = "hinderItem"+i+""
        document.getElementById("mainShowValue").appendChild(a)
        local.push(i)
    }

    for (var i = valueInputSort.length - 1; i > 0; i--) {
        var arrow = document.createElement("connection");
        var from = "#hinderItem"+(Math. round( i/2 )-1)+""
        var to = "#hinderItem"+(i)+""
        arrow.setAttribute("from",from);
        arrow.setAttribute("to",to);
        arrow.setAttribute("color","black");
        arrow.setAttribute("tail","true");
        // fromX="0" fromY="1" toX="0" toY="0.75"
        if (i<7){
            if( i % 2 === 0){
                arrow.setAttribute("fromX","0.5")
                arrow.setAttribute("fromY","0.5")
                arrow.setAttribute("toX","0")
                arrow.setAttribute("toY","0.35")
            }else{
                arrow.setAttribute("fromX","0.5")
                arrow.setAttribute("fromY","0.5")
                arrow.setAttribute("toX","1")
                arrow.setAttribute("toY","0.3")
            }
        }
        else {
            arrow.setAttribute("fromX","0.5")
            arrow.setAttribute("fromY","0.5")
            arrow.setAttribute("toX","0.5")
            arrow.setAttribute("toY","0")
        }
        document.getElementById("mainShowValue").appendChild(arrow);
    }
    createTreeNode()
}
function createTreeNode(){
    for (var i = 0; i < valueInputSort.length; i++) {
        var a = document.createElement("div");
        a.className = "childShow";
        a.style.top = pointTrees[i].top + "px";
        a.style.left = pointTrees[i].left + "px";
        a.innerHTML = valueInputSort[i]
        a.id = "showItem"+i+"";
        // a.id = "ShowItem"+i+""
        document.getElementById("mainShowValue").appendChild(a)
    }
}

function updateTreeNode(status, type){
    for (var i = 0; i < type.length; i++) {
        var idShow = "showItem"+type[i]+""
        var a = document.getElementById(idShow)
        if (status[i]==='1'){
            a.style.backgroundColor = "#ff4d4d"
        }else if(status[i]==='2'){
            a.style.backgroundColor = "#00e68a"
        }else if(status[i]==='3'){
            a.style.backgroundColor = "yellow"
        }else{
            a.style.backgroundColor = "#33ccff"
        }
        a.style.top = pointTrees[parseInt(i)].top + "px"
        a.style.left = pointTrees[parseInt(i)].left + "px"
    }
}



function resetAllTree(){
    document.getElementById("mainShowValue").remove()
    var reset = document.createElement("div")
    reset.id = "mainShowValue"
    document.getElementById("mainShow").appendChild(reset);
}

function showCommentToDesktop(){
    for(var i = 0; i<commentShow.length; i++){
        var idnode = "node"+i+"";
        var show = document.createElement('div');
        var showChill1 = document.createElement('div');
        var showChill2 = document.createElement('div');
        show.className = "node-cha";
        show.id = idnode;
        showChill1.className = "nodes-comment"
        showChill2.className = "nodes-comment-count"
        showChill1.innerHTML = "* Lượt "+i+": "+commentShow[i].comment
        showChill2.innerHTML = "- Array => "
        show.appendChild(showChill1)
        show.appendChild(showChill2)
        
        
        document.getElementById('comment').appendChild(show);
        showChillCommentToDesktop(i)
    }
}

function showChillCommentToDesktop(i){
    var a=commentShow[i].array;
    var aStatus = commentShow[i].status
    var aChills = a.split(',')
    var aStatusChill = aStatus.split(',')
    var idnode = "node"+i+"";
    for (var i = 0; i<aChills.length; i++){
        var nodechills = document.createElement('div');
        nodechills.className = "nodes"
        if (aStatusChill[i] === '3'){
            nodechills.style.backgroundColor = "#ffff80";
        }
        nodechills.innerHTML = aChills[i]
        document.getElementById(idnode).appendChild(nodechills)
    }
}

function deleteCommentShow(){
    var myobj = document.getElementById("comment");
    myobj.remove();
    var myobj = document.createElement("div");
    var myojbChill = document.createElement("h2");
    myojbChill.innerHTML = "Comment và giải thích"
    myobj.appendChild(myojbChill);
    myobj.id="comment"
    document.getElementById("comment-father").appendChild(myobj);
}

