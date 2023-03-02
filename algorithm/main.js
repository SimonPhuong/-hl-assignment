function miniMaxSum(arr) {

    arr.sort((a, b) => a - b);
    let minSum = 0
    let maxSum = 0

    for (let i =0; i < arr.length; i++) {
        if( i < arr.length -1 ) {
            minSum += arr[i]
        } 
        if (i > 0) {
            maxSum += arr[i]
        }
    }

    console.log(`${minSum} ${maxSum}`);

}

const list = [1,11,4,2,3]; //1 11 2 3 4
//expect: 10 20
miniMaxSum(list);