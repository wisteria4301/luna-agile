<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/jsp/lunaops/top/header.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/top.jsp" />
<jsp:include page="/WEB-INF/jsp/lunaops/top/aside.jsp" />
<div class="kt-portlet kt-portlet--mobile">
	<div class="kt-portlet__head kt-portlet__head--lg">
		<div class="kt-portlet__head-label">
			<h4 class="kt-font-boldest kt-font-brand">
				<i class="fa fa-th-large kt-margin-r-5"></i><span data-lang-cd="arm1000.label.title">MESSAGE</span>
			</h4>
		</div>
	</div>
</div>
<div class="row">
	<div class="col-lg-3 col-md-4 col-sm-4 col-4">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__body">
				<ul class="kt-nav kt-nav--bold kt-nav--md-space kt-nav--v3 nav nav-tabs" role="tablist">
					<li class="kt-nav__item" id="menuTypeGet">
						<a class="kt-nav__link kt-padding-l-0 kt-padding-r-0 active" data-toggle="tab" href="#kt_profile_tab_personal_information" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-inbox"></i></span>
							<span class="kt-nav__link-text kt-font-boldest kt-font-lg" data-lang-cd="arm1000.label.get">받은 메세지</span>
							<span class='badge badge-secondary osl-min-w-px-35 kt-font-bolder kt-font-lg kt-font-brand kt-hide' id="notReadGetCntBadge" name="notReadGetCntBadge">0</span>
						</a>
					</li>
					<li class="kt-nav__item" id="menuTypeSend">
						<a class="kt-nav__link kt-padding-l-0 kt-padding-r-0" data-toggle="tab" href="#kt_profile_tab_account_information" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-paper-plane"></i></span>
							<span class="kt-nav__link-text kt-font-boldest kt-font-lg" data-lang-cd="arm1000.label.send">보낸 메세지</span>
						</a>
					</li>
					<li class="kt-nav__item" id="menuTypeAlone">
						<a class="kt-nav__link kt-padding-l-0 kt-padding-r-0" data-toggle="tab" href="#kt_profile_change_password" role="tab">
							<span class="kt-nav__link-icon"><i class="fas fa-envelope-square"></i></span>
							<span class="kt-nav__link-text kt-font-boldest kt-font-lg" data-lang-cd="arm1000.label.alone">나에게 보낸 메세지</span>
							<span class='badge badge-secondary osl-min-w-px-35 kt-font-bolder kt-font-lg kt-font-brand kt-hide' id="notReadAloneCntBadge" name="notReadAloneCntBadge">0</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="col-lg-9 col-md-8 col-sm-8 col-8">
		<div class="kt-portlet kt-portlet--mobile">
			<div class="kt-portlet__head">
				<div class="kt-portlet__head-label">
					<!-- 받은 메세지 -->
					<span class="kt-font-boldest kt-font-lg" id="getAllCnt" name="getAllCnt">
						<span>받은 메세지</span>
						<span class='kt-font-brand kt-margin-l-20' id="notReadGetCnt" name="notReadGetCnt">0</span>
						<span id="getCnt" name="getCnt"></span>
					</span>					
					<!-- 보낸 메세지 -->
					<span class="kt-hide kt-font-boldest kt-font-lg" id="sendAllCnt" name="sendAllCnt">
						<span>보낸 메세지</span>
						<span class="kt-margin-l-20" id="sendCnt" name="sendCnt"></span>
					</span>
					<!-- 나에게 보낸 메세지 -->
					<span class="kt-hide kt-font-boldest kt-font-lg" id="aloneAllCnt" name="aloneAllCnt">
						<span>나에게 보낸 메세지</span>
						<span class='kt-font-brand kt-margin-l-20' id="notReadAloneCnt" name="notReadAloneCnt">0</span>
						<span id="aloneCnt" name="aloneCnt"></span>
					</span>
				</div>
				<div class="kt-portlet__head-toolbar">
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="select" title="메세지 조회" data-title-lang-cd="arm1000.button.tooltip.selectBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="select" tabindex="1">
						<i class="fa fa-list"></i><span data-lang-cd="datatable.button.select">조회</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="insert" title="메세지 보내기" data-title-lang-cd="arm1000.button.tooltip.insertBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="insert" tabindex="2">
						<i class="fas fa-edit"></i><span data-lang-cd="datatable.button.insert">쓰기</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="reInsert" title="메세지 답장" data-title-lang-cd="arm1000.button.tooltip.reInsertBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="reInsert" tabindex="3">
						<i class="fas fa-envelope-open-text"></i><span data-lang-cd="arm1000.button.reInsertBtn">답장</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="check" title="메세지 읽음 처리" data-title-lang-cd="arm1000.button.tooltip.checkBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="check" tabindex="4">
						<i class="fas fa-envelope-open"></i><span data-lang-cd="arm1000.button.checkBtn">읽음</span>
					</button>
					<button type="button" class="btn btn-outline-brand btn-bold btn-font-sm kt-margin-l-5 kt-margin-r-5 btn-elevate btn-elevate-air" data-datatable-id="arm1000ArmTable" data-datatable-action="delete" title="메세지 삭제" data-title-lang-cd="arm1000.button.tooltip.deleteBtn" data-toggle="kt-tooltip" data-skin="brand" data-placement="bottom" data-auth-button="delete" tabindex="5">
						<i class="fa fa-trash-alt"></i><span data-lang-cd="datatable.button.delete">삭제</span>
					</button>
				</div>
			</div>
			<div class="kt-portlet__body">
				<div class="row">
					<div class="col-5"> 
						<div class="osl-datatable-search" data-datatable-id="arm1000ArmTable"></div>
					</div>
				</div>
				<div class="kt_datatable kt-margin-b-0" id="arm1000ArmTable"></div>
			</div>
		</div>
	</div>
</div>
<!-- begin page script -->
<script>
"use strict";
var OSLArm1000Popup = function () {
	var datatableId = "arm1000ArmTable";
	
	var documentSetting = function(){
		$.osl.datatable.setting(datatableId,{
			data: {
				source: {
					read: {
						url: "/arm/arm1000/arm1000/selectArm1000AlarmListAjax.do"
					},
					params: {
						armMenuType : "get"
					},
				},
			},
			columns: [
				{field: 'checkbox', title: '#', textAlign: 'center', width: 20, selector: {class: 'kt-checkbox--solid'}, sortable: false, autoHide: false},
				{field: 'rn', title: 'No.', textAlign: 'center', width: 50, sortable: true},
				{field: 'checkCd', title: '읽음 상태', textAlign: 'center', width: 80, sortable: true,
					template: function (row) {
						console.log();
						var returnStr = "";
						if(row.checkCd == "02"){
							//안읽은것
							returnStr += "<i class='fas fa-envelope kt-font-brand kt-font-lg'></i>";
						}else{
							//읽은것
							returnStr += "<i class='fas fa-envelope-open kt-font-metal kt-font-lg'></i>";
						}
							
						return returnStr;
					}
				},
				{field: 'sendUsrNm', title: '보낸 사람', textAlign: 'left', autoHide: false, width: 120, sortField: "sendUsrNm", search:true, sortable: true,
					template: function (row) {
						if($.osl.isNull(row.sendUsrNm)){
							row.sendUsrNm = "";
						}
						var usrData = {
							html: row.sendUsrNm,
							imgSize: "sm",
							class:{
								cardBtn: "osl-width__fit-content"
							}
						};
						return $.osl.user.usrImgSet(row.sendUsrImgId, usrData);
					},
					onclick: function(rowData){
						$.osl.user.usrInfoPopup(rowData.sendUsrId);
					}
				},
				{field: 'armTitle', title:'제목', textAlign: 'left', width: 400, autoHide: false, sortField: "armTitle", search: true},
				{field: 'sendDtm', title: '날짜', textAlign: 'center', width: 120, sortField: "sendDtm", search: true, searchType:"daterange", sortable: true,
					template: function (row) {
						var paramDatetime = new Date(row.sendDtm);
		                var agoTimeStr = $.osl.datetimeAgo(paramDatetime, {fullTime: "d", returnFormat: "yyyy-MM-dd"});
		                return agoTimeStr.agoString;
					}
				},
			],
			searchColumns:[
				{field: 'sendUsrId', title: $.osl.lang("arm1000.field.sendUsrId"), searchOrd: 1},
				{field: 'sendUsrEmail', title: $.osl.lang("arm1000.field.sendUsrEmail"), searchOrd: 2},
				{field: 'usrNm', title: $.osl.lang("arm1000.field.usrNm"), searchOrd: 3},
				{field: 'usrId', title: $.osl.lang("arm1000.field.usrId"), searchOrd: 4},
				{field: 'usrEmail', title: $.osl.lang("arm1000.field.usrEmail"), searchOrd: 5},
				{field: 'armContent', title: $.osl.lang("arm1000.field.armContent"), searchOrd: 7}
			],
			rows:{
				beforeTemplate : function(row, data, index){
					if(data.checkCd == '02'){
						//안읽은 것
						$(row).css("font-weight", "bold");
					}
				},
				clickCheckbox: true,
			},
			actionBtn:{
				"title": $.osl.lang("arm1000.actionBtn.title"),
				"reInsert" : true,
				"update" : false,
				"dblClick" : true,
				"check" : true,
			},
			actionTooltip:{
				"reInsert" : $.osl.lang("arm1000.button.tooltip.reInsertBtn"),
				"dblClick" : $.osl.lang("arm1000.button.tooltip.dblClickBtn"),
				"check" : $.osl.lang("arm1000.button.tooltip.checkBtn"),
			},
			actionFn:{
				"insert":function(datatableId, type, rowNum){
					var data = {type:"insert"};
					var options = {
							idKey: datatableId,
							modalTitle: $.osl.lang("arm1000.actionBtn.insertTitle"),
							closeConfirm: false,
							autoHeight:false,
						};
					
					$.osl.layerPopupOpen('/arm/arm1000/arm1000/insertArm1001View.do',data,options);
				},
				"reInsert":function(rowDatas, datatableId, type, rowNum){
					var data;
					var options;
					
					if(type == "list"){
						//선택 항목이 리스트인 경우
						if(rowNum == 0){
							$.osl.alert($.osl.lang("arm1000.alert.message.selectMessage"));
							return false;
						}else if(rowNum == 1){
							data = {
									type:"reInsert",
									reSendUsrId : rowDatas[0].sendUsrId,
									atchfileId : rowDatas[0].atchFileId
								};
							options = {
									idKey: "reInsert_"+rowDatas[0].armId,
									modalTitle: $.osl.lang("arm1000.actionBtn.reInsertTitle"),
									closeConfirm: false,
									autoHeight:false,
								};
						}else{
							//다중인 경우
							$.osl.alert($.osl.lang("arm1000.alert.message.selectOneMessage", rowNum));
							return false;
						}
					}else{
						//선택 항목이 row 단건인 경우
						data = {
								type:"reInsert",
								reSendUsrId : rowDatas.sendUsrId,
							};
						options = {
								idKey: "reInsert_"+rowDatas.armId,
								modalTitle: $.osl.lang("arm1000.actionBtn.reInsertTitle"),
								closeConfirm: false,
								autoHeight:false,
							};
					}
					
					$.osl.layerPopupOpen('/arm/arm1000/arm1000/insertArm1001View.do',data,options);
				},
				"delete":function(rowDatas, datatableId, type){
					var data = {
							dataList : JSON.stringify(rowDatas)
					};

					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/arm/arm1000/arm1000/deleteArm1000AlarmInfoAjax.do'/>", "async":"true"}
							,data);
					
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});

							//모달 창 닫기
							$.osl.layerPopupClose();
						}else{
							OSLArm1000Popup.reload();
						}
					});
					
					//AJAX 전송
					ajaxObj.send();
					
				},
				"dblClick":function(rowData, datatableId, type, rowNum){
					var data = {
							armId : rowData.armId
					};
					var options = {
							idKey: rowData.armId,
							modalTitle: $.osl.lang("arm1000.actionBtn.dblClickTitle"),
							closeConfirm: false,
							autoHeight:false,
					};
					
					$.osl.layerPopupOpen('/arm/arm1000/arm1000/selectArm1002View.do',data,options);
				},
				"check" : function(rowDatas){
					var data = {
							dataList : JSON.stringify(rowDatas)
					};
					
					//AJAX 설정
					var ajaxObj = new $.osl.ajaxRequestAction(
							{"url":"<c:url value='/arm/arm1000/arm1000/updateArm1000AlarmInfoAjax.do'/>", "async":"true"}
							,data);
					
					//AJAX 전송 성공 함수
					ajaxObj.setFnSuccess(function(data){
						if(data.errorYn == "Y"){
							$.osl.alert(data.message,{type: 'error'});

							//모달 창 닫기
							$.osl.layerPopupClose();
						}else{
							OSLArm1000Popup.reload();
						}
					});
					
					//AJAX 전송
					ajaxObj.send();
				}
			},
			theme:{
				actionBtn:{
					"reInsert" : "",
					"check" : " kt-hide",
				},
				actionBtnIcon:{
					"reInsert" : "fas fa-envelope-open-text",
					"check" : "fa flaticon2-check-mark",
				}
			},
			callback:{
				initComplete:function(evt, config){
					//초기 선택 - 받은 메세지
					$("#menuTypeGet").click();
				},
	   			ajaxDone: function(evt, list, datatableInfo){
	   				checkNotRead();
	   			},
			}
		});
		
		$("#menuTypeGet").click(function(){
			//선택 div
			$(".kt-nav__item").find('.kt-nav__link-icon,.kt-nav__link-text').removeClass("kt-font-brand");
			$("#menuTypeGet").find('.kt-nav__link-icon,.kt-nav__link-text').addClass("kt-font-brand");
			//선택 외 div
			$("#sendAllCnt,#aloneAllCnt").addClass("kt-hide");
			$("#getAllCnt").removeClass("kt-hide");
			//검색바 초기화
			searchReset();
			
			//데이터 테이블 검색 조건 변경 - 강제
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","get");
			//데이터 테이블 조회
 			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
		$("#menuTypeSend").click(function(){
			//선택 div
			$(".kt-nav__item").find('.kt-nav__link-icon,.kt-nav__link-text').removeClass("kt-font-brand");
			$("#menuTypeSend").find('.kt-nav__link-icon,.kt-nav__link-text').addClass("kt-font-brand");
			//선택 외 div
			$("#getAllCnt,#aloneAllCnt").addClass("kt-hide");
			$("#sendAllCnt").removeClass("kt-hide");
			//검색바 초기화
			searchReset();
			
			//데이터 테이블 검색 조건 변경 - 강제
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","send");
			//데이터 테이블 조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
		$("#menuTypeAlone").click(function(){
			//선택 div
			$(".kt-nav__item").find('.kt-nav__link-icon,.kt-nav__link-text').removeClass("kt-font-brand");
			$("#menuTypeAlone").find('.kt-nav__link-icon,.kt-nav__link-text').addClass("kt-font-brand");
			//선택 외 div
			$("#getAllCnt,#sendAllCnt").addClass("kt-hide");
			$("#aloneAllCnt").removeClass("kt-hide");
			//검색바 초기화
			searchReset();
			
			//데이터 테이블 검색 조건 변경 - 강제
			$.osl.datatable.list[datatableId].targetDt.setDataSourceParam("armMenuType","alone");
			//데이터 테이블 조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
		});
		
	};
	
	/**
	 * 안읽은 메세지 개수 확인
	 */
	var checkNotRead = function(){
		//ajax 설정
		var ajaxObj = new $.osl.ajaxRequestAction(
    			{"url":"<c:url value='/arm/arm1000/arm1000/selectArm1000AlarmNotReadCntAjax.do'/>"});
		//ajax 전송 성공 함수
    	ajaxObj.setFnSuccess(function(data){
    		if(data.errorYn == "Y"){
				$.osl.alert(data.message,{type: 'error'});
				//모달 창 닫기
				$.osl.layerPopupClose();
			}else{
				var allMessage = data.allMessage;
				console.log(data);
				var notRead = data.notRead;
				console.log(notRead);
				//안읽은개수가 있는 경우 받은 메세지 표출
				if(notRead.get>0){
					$("#notReadGetCntBadge,#notReadGetCnt").removeClass("kt-hide");
					$("#notReadGetCntBadge,#notReadGetCnt").text(notRead.get);
					$("#getCnt").text(" / " + allMessage.get);
					
				//안읽은 개수가 없는 경우 숫자 자체를 숨김
				}else{
					$("#getBadgeSpan").addClass("kt-hide");
					$("#notReadGetCntBadge").text("0");
					$("#getCnt").text(allMessage.get);
				}
				//보낸 메세지 개수
				$("#sendCnt").text(allMessage.send);
				//나에게 쓴 안읽은
				if(notRead.alone>0){
					$("#notReadAloneCntBadge,#notReadAloneCnt").removeClass("kt-hide");
					$("#notReadAloneCntBadge,#notReadAloneCnt").text(notRead.alone);
					$("#aloneCnt").text(" / " + allMessage.alone);
				//나에쓴 다읽은
				}else{
					$("#notReadAloneCnt").addClass("kt-hide");
					$("#notReadAloneCnt").text("0");
					$("#aloneCnt").text(" / " + allMessage.alone);
				}
			}
    	});
		//ajax 전송
    	ajaxObj.send();
	};
	
	/**
	* 검색바 초기화
	*/
	var searchReset = function(){
		//드롭다운 메뉴 선택 활성화 취소 및 재선택
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item.active").attr("class", "dropdown-item");
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").attr("class", "dropdown-item active");
		
		//검색 메뉴 명 가져오기
		var searchBarMenuStr = $(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").children("a.dropdown-item[data-field-id=-1]").text();
		
		//검색 메뉴 버튼 변경
		$(".dropdown-menu.osl-datatable-search__dropdown[data-datatable-id="+datatableId+"]").parent().children(".btn.btn-secondary.dropdown-toggle").text(searchBarMenuStr);
		
		//select 감추기
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("style", "display:none;");
		$(".form-control.kt-select2.osl-datatable-search__select[data-datatable-id="+datatableId+"]").attr("aria-hidden", "true");
		
		//input 보이기
		$("#searchData_"+datatableId).removeAttr("readonly");
		//그려진 캘린터 아이콘이 있는 경우 지우기
		$("#searchData_"+datatableId).parent().children("span").children().children().removeClass("la-calendar");
		
		//input에 검색 값 비우기
		$("#searchData_"+datatableId).val("");

		//전체 검색 막기
		//input disabled
		$("#searchData_"+datatableId).attr("disabled","disabled");
	}
	
	return {
        // public functions
        init: function() {
        	documentSetting();
        },
        reload: function(){
			//datatable 조회
			$("button[data-datatable-id="+datatableId+"][data-datatable-action=select]").click();
        	checkNotRead();
        }
        
    };
}();

$.osl.ready(function(){
	OSLArm1000Popup.init();
});
</script>
<!-- end script -->
<jsp:include page="/WEB-INF/jsp/lunaops/bottom/footer.jsp" />