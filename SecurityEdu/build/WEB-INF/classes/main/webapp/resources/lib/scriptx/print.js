//ScriptX를 추가시킨다.
var factory;
var Portrait = true;

document.write("<object id=factory style='display:none' classid='clsid:1663ed61-23eb-11d2-b92f-008048fdd814' codebase='/resources/lib/scriptx/smsx.cab#Version=6,5,439,50'></object>");

function PrintSetting(){
	try{
		/*기본값으로 셋팅해 놓는다*/
		/*ScriptX의 Basic 기능만을 사용해야 라이센스문제가 없다.. Basic기능은 Free 로 사용가능한 컴포넌트이기 때문... */
		/* Basic 기능 Header, Footer, Margins, Orientation */
		factory.printing.header = ""; // Header에 들어갈 문장
		factory.printing.footer = ""; // Footer에 들어갈 문장
		factory.printing.leftMargin = 10.0; // 왼쪽 여백 사이즈
		factory.printing.topMargin = 10.0; // 위 여백 사이즈
		factory.printing.rightMargin = 10.0; // 오른쪽 여백 사이즈
		factory.printing.bottomMargin = 10.0; // 아래 여백 사이즈
  		if(Portrait == true){
	  		factory.printing.portrait = true;// true 면 세로인쇄, false 면 가로인쇄
		}else{
		  	factory.printing.portrait = false;// true 면 세로인쇄, false 면 가로인쇄
  		}
  	}catch(e){
  	}
}

function PrintPortrait(b){
	if(b)
		Portrait = true;
	else
		Portrait = false;
}

function PrintErrMsg(){
	alert("컴포넌트가 설치되지 않았습니다.\n\n컴포넌트 설치 메시지가 나오면 \"예\"를 눌러 설치하시기 바랍니다.\n\n인쇄화면을 [새로고침] 또는 창을 다시 띄우시기 바랍니다.");
}

window.onbeforeprint = PrintFactoryCheck;
function PrintFactoryCheck(){
	try{
		if(!factory.printing){
			alert("프린트 컴포넌트가 제대로 설치되지 않았습니다.\n\n컴포넌트 설치 메시지가 나오면 \"예\"를 눌러 설치하시거나 현재화면을 [새로고침] 또는 창을 다시 띄우시기 바랍니다.\n\n아직 컴포넌트가 설치가 안된경우엔 10초후 인쇄를 다시 시도하시기 바랍니다.");
		}
	}catch(e){
		alert("프린트 컴포넌트가 제대로 설치되지 않았습니다.\n\n컴포넌트 설치 메시지가 나오면 \"예\"를 눌러 설치하시거나 현재화면을 [새로고침] 또는 창을 다시 띄우시기 바랍니다.\n\n아직 컴포넌트가 설치가 안된경우엔 10초후 인쇄를 다시 시도하시기 바랍니다.");
	}
}
function pageInit(t){
	if(factory == undefined)
		factory = t;
	if(factory.printing)
		setTimeout("PrintSetting();",100);
}

