﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MyCalendar.aspx" Inherits="System.Web.Mvc.ViewPage" %>
<%@ Import Namespace="AzureCalendarMvcWeb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title><%=Html.Resource("lang,title")%></title>
    <link href="<%=Url.Content("~/Theme/Default/main.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=Url.Content("~/Theme/Default/dailog.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=Url.Content("~/Theme/Default/calendar.css") %>" rel="stylesheet" type="text/css" /> 
    <link href="<%=Url.Content("~/Theme/Default/dp.css") %>" rel="stylesheet" type="text/css" />   
    <link href="<%=Url.Content("~/Theme/Default/alert.css") %>" rel="stylesheet" type="text/css" />     
    <link href="<%=Url.Content("~/Theme/Shared/blackbird.css") %>" rel="stylesheet" type="text/css" />
</head>
<body>
    <div>
      <div id="calhead" style="padding-left:1px;padding-right:1px;">          
            <div class="cHead"><div class="ftitle"><%=Html.Resource("lang,title")%></div>
            <div id="loadingpannel" class="ptogtitle loadicon" style="display: none;"><%=Html.Resource("lang,loaddatamsg")%></div>
             <div id="errorpannel" class="ptogtitle loaderror" style="display: none;"><%=Html.Resource("lang,defaulterrormsg")%></div>
            </div>          
            
            <div id="caltoolbar" class="ctoolbar">
              <div id="faddbtn" class="fbutton">
                <div><span title='<%=Html.Resource("lang,new_event_title")%>' class="addcal">
                <%=Html.Resource("lang,new_event")%>                
                </span></div>
            </div>
            <div class="btnseparator"></div>
             <div id="showtodaybtn" class="fbutton">
                <div><span title='<%=Html.Resource("lang,today_title")%> ' class="showtoday">
                <%=Html.Resource("lang,today")%></span></div>
            </div>
              <div class="btnseparator"></div>
            <div id="showdaybtn" class="fbutton">
                <div><span title='<%=Html.Resource("lang,day")%>' class="showdayview"><%=Html.Resource("lang,day")%></span></div>
            </div>
              <div  id="showweekbtn" class="fbutton fcurrent">
                <div><span title='<%=Html.Resource("lang,week")%>' class="showweekview"><%=Html.Resource("lang,week")%></span></div>
            </div>
              <div  id="showmonthbtn" class="fbutton">
                <div><span title='<%=Html.Resource("lang,month")%>' class="showmonthview"><%=Html.Resource("lang,month")%></span></div>
            </div>
            <div class="btnseparator"></div>
              <div  id="showreflashbtn" class="fbutton">
                <div><span title='<%=Html.Resource("lang,refresh_title")%>' class="showdayflash"><%=Html.Resource("lang,refresh")%></span></div>
                </div>
             <div class="btnseparator"></div>
            <div id="sfprevbtn" title="<%=Html.Resource("lang,prev_title")%>"  class="fbutton">
              <span class="fprev"></span>
            </div>
            <div id="sfnextbtn" title="<%=Html.Resource("lang,next_title")%>" class="fbutton">
                <span class="fnext"></span>
            </div>
            <div class="fshowdatep fbutton">
                    <div>
                        <input type="hidden" name="txtshow" id="hdtxtshow" />
                        <span id="txtdatetimeshow">Loading</span>
                    </div>
            </div>
            <div class="btnseparator"></div>
            <div id="changetochinese" class="fbutton">
                <div><span title='<%=Html.Resource("lang,chinese")%>' class="chinese"><%=Html.Resource("lang,chinese")%></span></div>
            </div>
            <div id="changetoenglish" class="fbutton">
                <div><span title='<%=Html.Resource("lang,english")%>' class="english"><%=Html.Resource("lang,english")%></span></div>
            </div>
             <div id="changetoenglishau" class="fbutton">
                <div><span title='<%=Html.Resource("lang,english")%>' class="english_au"><%=Html.Resource("lang,english")%></span></div>
            </div>
            <div class="clear"></div>
            </div>
      </div>
      <div style="padding:1px;">
        <div class="t1 chromeColor">
            &nbsp;</div>
        <div class="t2 chromeColor">
            &nbsp;</div>
        <div id="dvCalMain" class="calmain printborder">
            <div id="gridcontainer" style="overflow-y: visible;">
            </div>
        </div>
        <div class="t2 chromeColor">
            &nbsp;</div>
        <div class="t1 chromeColor">
            &nbsp;
        </div>   
        </div>
     
  </div>
    <script src="<%=Url.Content("~/Javascripts/jquery.min.js")%>" type="text/javascript"></script>  
    <script src="<%=Url.Content("~/Javascripts/Common.js")%>" type="text/javascript"></script>    
    <script src="<%=Url.Content("~/Javascripts/lib/blackbird.js")%>" type="text/javascript"></script> 
    <script src="<%=Url.Content(Html.Resource("lang,datepicker_langpack_url"))%>" type="text/javascript"></script>     
    <script src="<%=Url.Content("~/Javascripts/Plugins/jquery.datepicker.js")%>" type="text/javascript"></script>
    <script src="<%=Url.Content("~/Javascripts/Plugins/jquery.alert.js")%>" type="text/javascript"></script>    
    <script src="<%=Url.Content("~/Javascripts/Plugins/jquery.ifrmdailog.js")%>" defer="defer" type="text/javascript"></script>
    <script src="<%=Url.Content(Html.Resource("lang,calendar_langpack_url"))%>" type="text/javascript"></script>  
    <script src="<%=Url.Content("~/Javascripts/Plugins/jquery.calendar.min.js?v=1.2.0.2")%>" type="text/javascript"></script>   
    <script type="text/javascript">
        $(document).ready(function() {
            //[id,title,start,end，全天日程，跨日日程,循环日程,theme,'','']          
           var view="week";          
           <%Html.RenderPartial("_CurrentCalData"); %>
            var op = {
                view: view,
                theme:3,
                showday: new Date(),
                EditCmdhandler:Edit,
                DeleteCmdhandler:Delete,
                ViewCmdhandler:View,    
                onWeekOrMonthToDay:wtd,
                onBeforeRequestData: cal_beforerequest,
                onAfterRequestData: cal_afterrequest,
                onRequestDataError: cal_onerror, 
                url: "<%=Url.Action("GetPersonalCalViewData")%>" ,  
                quickAddUrl: "<%=Url.Action("QuickAddPersonalCal")%>", //快速添加日程Post Url 地址
                quickUpdateUrl:"<%=Url.Action("QuickUpdatePersonalCal")%>",
                quickDeleteUrl: "<%=Url.Action("QuickDeletePersonalCal")%>"//快速删除日程的              
            };
            var $dv = $("#calhead");
            var _MH = document.documentElement.clientHeight;
            var dvH = $dv.height() + 2;
            op.height = _MH - dvH;
            op.eventItems =__CURRENTDATA;

            var p = $("#gridcontainer").bcalendar(op).BcalGetOp();
            if (p && p.datestrshow) {
                $("#txtdatetimeshow").text(p.datestrshow);
            }
            $("#caltoolbar").noSelect();
            
            $("#hdtxtshow").datepicker({ picker: "#txtdatetimeshow", showtarget: $("#txtdatetimeshow"),
            onReturn:function(r){                          
                            var p = $("#gridcontainer").BCalGoToday(r).BcalGetOp();
                            if (p && p.datestrshow) {
                                $("#txtdatetimeshow").text(p.datestrshow);
                            }
                     } 
            });
            function cal_beforerequest(type)
            {
                var t="<%=Html.Resource("lang,loaddatamsg")%>";
                switch(type)
                {
                    case 1:
                        t="<%=Html.Resource("lang,loaddatamsg")%>";
                        break;
                    case 2:                      
                    case 3:  
                    case 4:    
                        t="<%=Html.Resource("lang,processdatamsg")%>";                                   
                        break;
                }
                $("#errorpannel").hide();
                $("#loadingpannel").html(t).show();    
            }
            function cal_afterrequest(type)
            {
                switch(type)
                {
                    case 1:
                        $("#loadingpannel").hide();
                        break;
                    case 2:
                    case 3:
                    case 4:
                        $("#loadingpannel").html("<%=Html.Resource("lang,successmsg")%>");
                        window.setTimeout(function(){ $("#loadingpannel").hide();},2000);
                    break;
                }              
               
            }
            function cal_onerror(type,data)
            {
                $("#errorpannel").show();
            }
            function Edit(data)
            {
               var eurl="<%=Url.Action("EditCalendar")%>/{0}?start={2}&end={3}&isallday={4}&title={1}";   
                if(data)
                {
                    var url = StrFormat(eurl,data);
                    OpenModelWindow(url,{ width: 600, height: 400, caption:"<%=Html.Resource("lang,editcalendar")%>",onclose:function(){
                       $("#gridcontainer").BCalReload();
                    }});
                }
            }    
            function View(data)
            {
                var vurl="<%=Url.Action("ViewCalendar")%>/{0}";   
                if(data)
                {
                    var url = StrFormat(vurl,data);
                    OpenModelWindow(url,{ width: 600, height: 400, caption: "<%=Html.Resource("lang,viewcalendar")%>"});
                }                
            }    
            function Delete(data,callback)
            {           
                
                $.alerts.okButton="<%=Html.Resource("lang,ok")%>";  
                $.alerts.cancelButton="<%=Html.Resource("lang,cancel")%>";  
                hiConfirm("<%=Html.Resource("lang,deleteconfirm")%>", '<%=Html.Resource("lang,confirm")%>',function(r){ r && callback(0);});           
            }
            function wtd(p)
            {
               if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
                $("#caltoolbar div.fcurrent").each(function() {
                    $(this).removeClass("fcurrent");
                })
                $("#showdaybtn").addClass("fcurrent");
            }
            //显示日视图
            $("#showdaybtn").click(function(e) {
                //document.location.href="#day";
                $("#caltoolbar div.fcurrent").each(function() {
                    $(this).removeClass("fcurrent");
                })
                $(this).addClass("fcurrent");
                var p = $("#gridcontainer").BCalSwtichview("day").BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
            });
            //显示周视图
            $("#showweekbtn").click(function(e) {
                //document.location.href="#week";
                $("#caltoolbar div.fcurrent").each(function() {
                    $(this).removeClass("fcurrent");
                })
                $(this).addClass("fcurrent");
                var p = $("#gridcontainer").BCalSwtichview("week").BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }

            });
            //显示月视图
            $("#showmonthbtn").click(function(e) {
                //document.location.href="#month";
                $("#caltoolbar div.fcurrent").each(function() {
                    $(this).removeClass("fcurrent");
                })
                $(this).addClass("fcurrent");
                var p = $("#gridcontainer").BCalSwtichview("month").BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
            });
            
            $("#showreflashbtn").click(function(e){
                $("#gridcontainer").BCalReload();
            });
            
            //点击新增日程
            $("#faddbtn").click(function(e) {
                var url ="<%=Url.Action("EditCalendar")%>";
                OpenModelWindow(url,{ width: 500, height: 400, caption: "<%=Html.Resource("lang,addcalendar")%>"});
            });
            //点击回到今天
            $("#showtodaybtn").click(function(e) {
                var p = $("#gridcontainer").BCalGoToday().BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }


            });
            //上一个
            $("#sfprevbtn").click(function(e) {
                var p = $("#gridcontainer").BCalPrev().BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }

            });
            //下一个
            $("#sfnextbtn").click(function(e) {
                var p = $("#gridcontainer").BCalNext().BcalGetOp();
                if (p && p.datestrshow) {
                    $("#txtdatetimeshow").text(p.datestrshow);
                }
            });
            $("#changetochinese").click(function(e){
                location.href="<%=Url.Action("Setlang", "Home", new {lang="zh-CN" })%>";
            });
            $("#changetoenglish").click(function(e){
                location.href="<%=Url.Action("Setlang", "Home", new {lang="en-US" })%>";
            });
             $("#changetoenglishau").click(function(e){
                location.href="<%=Url.Action("Setlang", "Home", new {lang="en-AU" })%>";
            });
            
        });
    </script>
    
</body>
</html>
