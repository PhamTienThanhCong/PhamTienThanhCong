function heapifyDown(valueInputSort, N, i){
    let left = 2*i + 1, right = 2*i + 2, largest;

	var arrayStatus = copyArray(statusTrees)
    
    // graphic
    arrayStatus[i]=2;
    showTree.push({
        status: convetArrayToString(arrayStatus),
        localCopy: convetArrayToString(local),
        comment: TextComment
    })
    // graphic

    if(left < N && valueInputSort[left] < valueInputSort[i]) {
        largest = left;
        
        // graphic
        arrayStatus[i]=2;
        arrayStatus[left] = 1
        arrayStatus[right] = 0

        showTree.push({
            status: convetArrayToString(arrayStatus),
            localCopy: convetArrayToString(local),
            comment: TextComment
        })
        // graphic
    }
    else {
        largest = i;
    }
		 
    if(right < N && valueInputSort[right] < valueInputSort[largest]) {
        largest = right;

        // graphic
        arrayStatus[i]=2;
        arrayStatus[left] = 0
        arrayStatus[right] = 1

        showTree.push({
            status: convetArrayToString(arrayStatus),
            localCopy: convetArrayToString(local),
            comment: TextComment
        })
        // graphic
    }
		 
    if(largest != i){
        let t = valueInputSort[i];
        valueInputSort[i] = valueInputSort[largest];
        valueInputSort[largest] = t;

        t = local[i];
        local[i] = local[largest];
        local[largest] = t;

        // graphic
        arrayStatus[i]=1;
        arrayStatus[left] = 0
        arrayStatus[right] = 0
        showTree.push({
            status: convetArrayToString(arrayStatus),
            localCopy: convetArrayToString(local),
            comment: TextComment
        })
        // graphic

        heapifyDown(valueInputSort,N, largest);
    }
}
		     
function buildHeapDown(){
    commentShow.push({
        comment: "Xắp xếp giảm với Dãy đã cho là: ",
        array: convetArrayToString(valueInputSort),
        status: convetArrayToString(statusTrees),
        localCopy: convetArrayToString(local),
    })

    TextComment = "Vun đống, tìm giá trị nhỏ nhất để đặt lên đầu"
    let m = Math.floor(valueInputSort.length / 2 - 1);
    for(let i = m; i >= 0; i--){
        heapifyDown(valueInputSort, valueInputSort.length, i);
    }
    
    TextComment = "Vun đống Thành Công, Đỉnh Đống = "+ valueInputSort[0]
    // graphic
    arrayStatus = copyArray(statusTrees)
    showTree.push({
        status: convetArrayToString(arrayStatus),
        comment: TextComment,
        localCopy: convetArrayToString(local),
    })

    commentShow.push({
        comment: "vun đống với giá trị đỉnh đống là "+valueInputSort[0]+": ",
        array: convetArrayToString(valueInputSort),
        status: convetArrayToString(statusTrees),
    })

    // graphic
}
		     
function heapSortDown(){

    buildHeapDown();
    
    
    for(let i = valueInputSort.length - 1; i >= 0; i--)    {
        TextComment = "Đổi Chỗ "+valueInputSort[0]+" và "+ valueInputSort[i]+". Đỉnh Đống xuống cuối đống"

        statusTrees[lengthTree-1]='1'
        statusTrees[0]='1'

        showTree.push({
            status: convetArrayToString(statusTrees),
            localCopy: convetArrayToString(local),
            comment: TextComment
        })
        statusTrees[0]='0'

        let t = valueInputSort[0];
        valueInputSort[0] = valueInputSort[i];
        valueInputSort[i] = t;  
        
        // graphic
        var lt = local[0];
        local[0] = local[i];
        local[i] = lt;
        
        showTree.push({
            status: convetArrayToString(statusTrees),
            localCopy: convetArrayToString(local),
            comment: TextComment
        })

        commentShow.push({
            comment: "Đổi chỗ đỉnh đống là: "+t+" xuống đáy đống ",
            array: convetArrayToString(valueInputSort),
            status: convetArrayToString(statusTrees),
        })
        // graphic   
        statusTrees[i]='3' 
        lengthTree--; 
        TextComment = "Vun lại đống."
        heapifyDown(valueInputSort, i, 0);
        commentShow.push({
            comment: "Vun lại đống hoàn thành, và giá trị đống mới là: "+valueInputSort[0],
            array: convetArrayToString(valueInputSort),
            status: convetArrayToString(statusTrees),
        })
    }
    // graphic   
    statusTrees[0]='3'
    showTree.pop()
    showTree.push({
        status: convetArrayToString(statusTrees),
        localCopy: convetArrayToString(local),
        comment: "Xắp Xếp Thành Công"
    })

    commentShow.pop()
    commentShow.push({
        comment: "Xắp xếp đống thành công",
        array: convetArrayToString(valueInputSort),
        status: convetArrayToString(statusTrees),
    })
    // graphic   
}