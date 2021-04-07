
        function numberFormat(inputNumber) {
        	   return inputNumber.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }
        
        function timeFormat(inputNumber){
     	   return inputNumber.toString().replace(/\B(?=(\d{2})+(?!\d))/g, ":");
        }
        
        function bizNoFormat(inputNumber){
        	return inputNumber.toString().replace(/(\d{3})(\d{2})(\d{5})/, '$1-$2-$3');
        }
                
        function dateFormat(str) {
            var y = str.substr(0, 4);
            var m = str.substr(4, 2);
            var d = str.substr(6, 2);
            return y + "-" + m + "-" + d;
        }
        
		function getTodate(){
			var date = new Date();
		    var year = date.getFullYear();
		    var month = date.getMonth()+1;
		    var day = date.getDate();
		    if(month < 10){
		        month = "0"+month;
		    }
		    if(day < 10){
		        day = "0"+day;
		    }
		 
		    var today = year+""+month+""+day;
		    
		    return today;
		}
 		
 		// null 값 체크
 		function isEmpty(value){
			if(value == null || value.length === 0) {
				return "0";
			} 
			else{
				return value;
			}
    	}