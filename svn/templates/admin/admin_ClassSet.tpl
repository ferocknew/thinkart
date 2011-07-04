<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<link href="../../files/css/content_style.css" rel="stylesheet" type="text/css" />
<link href="../../files/css/font_link.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div class="breadcrumbs text_gray12_b link_gray12_b"> <img src="../../files/images/ico_breadcrumbs.gif" align="absmiddle" /> 当前位置: <a href="#"> 内容管理</a> / <span class="link_deepGray12_b"><a href="#">公司新闻</a></span> </div>
<div class="content_title"><img style="float:left;" src="../../files/images/ico_contentTitle.gif" />
	<div class="content_titleText">
		<li class="text_deepGray14_b">内容结构管理</li>
		<li class="text_deepGray10_b">Programs List</li>
	</div>
</div>
<div class="content_ctrlbar text_deepGray12_b">
	<div style="margin-top:9px; float:left;">新增主栏目
		<input type="text" name="newClassMaster" id="newClassMaster" />
		<input class="btm_submit" type="submit" name="button" id="newClassMasterSave" value=" "/>
	</div>
	<table border="0" align="right" cellpadding="0" cellspacing="0" class="link_deepGray12_b">
		<tr>
			<td><a href="#"><img src="../../files/images/ico_showList.gif" align="middle" /> 全部折叠</a></td>
			<td><a href="#"><img src="../../files/images/ico_hideList.gif" align="middle" /> 全部展开</a></td>
		</tr>
	</table>
</div>
<div class="programs text_deepGray12_b" style="display:none">
	<div style="display:none">
		<div class="programsList tree1_close">关于我们</div>
		<div class="programsList tree1_none">关于我们</div>
	</div>
	<div class="programsList tree1_open">
		<div class="programsEdit text_white12_b">
			<div class="programsEdit_tree tree2_close2" style="display:none"></div>
			<input name="textfield" type="text" class="programsEdit_input" id="textfield" value="关于我们" size="16" />
			<input class="programsEdit_btm" type="submit" name="button" id="button" value=" " />
		</div>
		<div class="editBar text_white12_b">
			<table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td width="53"><img src="../../files/images/btm_editBar_close.gif" align="top" /></td>
					<td width="180">添加子分类
						<input name="textfield2" type="text" class="input_createTree" id="textfield2" size="8" /></td>
					<td class="editBar_td" width="161">升降序 <img src="../../files/images/btm_putDown.gif" align="middle" /><img src="../../files/images/btm_putUp.gif" align="middle" />
						<input class="input_sort" name="textfield3" type="text" id="textfield3" value="0" size="3" maxlength="3" />
						<input class="programsEdit_btm" type="submit" name="button2" id="button2" value=" " /></td>
					<td class="editBar_td" width="117">删除此分类 <img src="../../files/images/ico_trash.gif" align="middle" /></td>
				</tr>
			</table>
		</div>
	</div>
	<div style="display:none">
		<div class="programsList tree2_close1">关于我们</div>
		<div class="programsList tree2_open1">关于我们</div>
		<div class="programsList tree3_3">关于我们</div>
		<div class="programsList tree3_4">关于我们</div>
		<div class="programsList tree2_none2">关于我们</div>
		<div class="programsList tree1_open">关于我们</div>
		<div class="programsList tree2_none1">关于我们</div>
		<div class="programsList tree2_close2">关于我们</div>
	</div>
</div>
<div id="ClassTree"> {$data name="list"}
	<div id="Master{data.ContentClassID}" class="programsItem">
		<div class="programsList tree1_close" masterclass="1" classid="{data.ContentClassID}"></div>
		<div class="programsList_text"><span style="font-weight:bolder; color:#000;" classid="{data.ContentClassID}" levelid="{data.LevelID}">{data.ClassName}</span> [{data.MDate dateformat="yyyy年mm月dd日"}]</div>
	</div>
	{/$data} </div>
<div id="HideDom" style="display:none;">
	<!--二级分类修改模板-->
	<div class="programsEdit text_white12_b">
		<div onclick="tree_click(this,'div_trees_58_48');" name="div_trees_lv2_class" class="programsList tree2_none"></div>
		<div class="editBar text_white12_b">
			<table cellspacing="0" cellpadding="0" border="0">
				<tbody>
					<tr>
						<td width="53"><img align="top" src="../../files/images/btm_editBar_close.gif"></td>
						<td width="200">添加子分类
							<input type="text" size="8" class="programsEdit_input">
							<input type="button" class="programsEdit_btm" value=" "></td>
						<td width="161" class="editBar_td">升降序 <img align="middle" onclick="orderdown()" style="cursor:pointer" src="../../files/images/btm_putDown.gif"><img align="middle" onclick="orderup()" style="cursor:pointer" src="../../files/images/btm_putUp.gif">
							<input type="text" maxlength="3" size="3" value="0" id="Order" name="Order" class="input_sort">
							<input type="button" onclick="contentClass_upd_order_check()" value=" " id="button2" name="button2" class="programsEdit_btm"></td>
						<td width="117" class="link_white12_b editBar_td"><a onclick="contentClass_del_check()" href="javascript:void(0);">删除此分类 <img align="absmiddle" src="../../files/images/ico_trash.gif"></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<input type="text" size="16" value="进出口企业" id="ContentClassUpd" class="programsEdit_input" name="ContentClassUpd">
		<input type="button" onclick="contentClass_upd_check()" value=" " id="button" name="button" class="programsEdit_btm">
	</div>
	<!--二级分类-->
	<div id="SonClassDomLevel2" class="programsItem">
		<div name="div_trees_lv2_class" class="programsList tree2_none"></div>
		<div class="programsList_text">进出口企业</div>
	</div>
	<!--分类修改模板-->
	<div name="div_trees_lv1" id="MasterClassDom" class="programsItem">
		<div class="programsEdit text_white12_b">
			<div onclick="tree_click(this,'div_trees_58');" name="div_trees_lv1_class" class="programsList tree1_open"></div>
			<div class="editBar text_white12_b">
				<table cellspacing="0" cellpadding="0" border="0">
					<tbody>
						<tr>
							<td width="53"><img align="top" src="../../files/images/btm_editBar_close.gif"></td>
							<td width="200">添加子分类
								<input name="ClassNameSon" type="text" class="programsEdit_input" id="ClassNameSon" size="8" maxlength="10">
								<input type="button" value=" " title="点击添加子分类" id="ClassNameSonAction" name="ClassNameSonAction" class="programsEdit_btm"></td>
							<td width="161" class="editBar_td">升降序 <img align="middle" onclick="orderdown()" style="cursor:pointer" src="../../files/images/btm_putDown.gif"><img align="middle" onclick="orderup()" style="cursor:pointer" src="../../files/images/btm_putUp.gif">
								<input type="text" maxlength="3" size="3" value="0" id="Order" name="Order" class="input_sort">
								<input type="button" onclick="contentClass_upd_order_check()" value=" " id="button2" name="button2" class="programsEdit_btm"></td>
							<td width="117" class="link_white12_b editBar_td"><a onclick="contentClass_del_check()" href="javascript:void(0);">删除此分类 <img align="absmiddle" src="../../files/images/ico_trash.gif"></a></td>
						</tr>
					</tbody>
				</table>
			</div>
			<input type="text" size="16" value="行业方案" id="MasterClassName" class="programsEdit_input" name="MasterClassName">
			<input type="button" value=" " title="点击修改分类名称" id="MasterClassNameReName" name="MasterClassNameReName" class="programsEdit_btm">
		</div>
	</div>
</div>
</body>
</html>
{include("../incDefaultScript.tpl")}
<script type="text/javascript">
	$("#newClassMasterSave").click(function(){
        var _ajaxData = {
            newClassMaster: $.trim($("#newClassMaster").val())
        };
        $.ajax({
            type: "POST",
            url: "../../"+_AjaxUrl+"?at=classcon&as=addmaster",
            data: _ajaxData,
			dataType :"json",
            success: function(json){
                if(!json.err){
					alert(json.msg);
					window.location.reload();
				}
            }
        });
	})

    //展开分类
    $(".programsList[masterclass='1']").toggle(function(e){
        $.getJSON("../../" + _AjaxUrl, {
            at: "classcon",
            as: "getsonlist",
            classid: $(this).attr("classid")
        }, function(json){
            $(e.currentTarget).toggleClass("tree1_close tree1_open");
            if (!json.err) {
                var _Data = json.data;
                var _innerHTML = $('<div style="display:none"></div>');
                var _$sonClassDomLevel2 = $("#SonClassDomLevel2");
                $(_Data).each(function(){
                    var _temp = _$sonClassDomLevel2.clone(true);
                    _temp.find("div").eq(1).text(this.ClassName);
                    _temp.appendTo(_innerHTML);
                });
                $(e.currentTarget).parent().after(_innerHTML);
                $(e.currentTarget).parent().next().fadeIn("normal");

            }
            else {
                $(e.currentTarget).parent().after($("<div> </div>"));
            }
        })
    }, function(e){
        $(this).toggleClass("tree1_close tree1_open").parent().next().fadeOut("normal", function(){
            $(this).remove();
        });
    })

	//编辑主分类
	$(".programsList_text span").click(function(){
		var _$MasterDom=$("#MasterClassDom");
		var _$ClassTree=$("#ClassTree");
		if(_$MasterDom.length){
			$("#MasterClassDom",_$ClassTree).remove();
			$(".programsItem").show();
			$("#Master"+$(this).attr("classid")).hide();
			$("#Master"+$(this).attr("classid")).after(_$MasterDom.clone().show());
			$("#MasterClassDom",_$ClassTree).find("#MasterClassName").val($(this).text()).attr("classid",$(this).attr("classid")).attr("levelid",$(this).attr("levelid"));

			//点击保存分类名称
			$("#MasterClassNameReName").click(function(){
				var _classID=$("#MasterClassName",_$ClassTree).attr("classID");
				var _className=$.trim($("#MasterClassName",_$ClassTree).val());
				var _ajaxData={ContentClassID:_classID,ClassName:_className};
				_className.length == 0 ? alert("分类名称不能为空！") : $.ajax({
                    type: "POST",
                    url: "../../" + _AjaxUrl + "?at=classcon&as=editmaster",
                    data: _ajaxData,
                    dataType: "json",
                    success: function(json){
                        if (!json.err) {
                            alert(json.msg);
                            window.location.reload();
                        }
                    }
                });
			})

			//点击添加子分类
			$("#ClassNameSonAction").click(function(){
				var _classID=$("#MasterClassName",_$ClassTree).attr("classID");
				var _sonClassName=$.trim($("#ClassNameSon").val());
				var _levelid=$("#MasterClassName",_$ClassTree).attr("levelid");
				var _ajaxData={UpClassId:_classID,sonClassName:_sonClassName,upClassLevelID:_levelid};

                _sonClassName.length == 0 ? alert("分类名称不能为空！") : $.ajax({
                    type: "POST",
                    url: "../../" + _AjaxUrl + "?at=classcon&as=addsonclass",
                    data: _ajaxData,
                    dataType: "json",
                    success: function(json){
						if (!json.err) {
                            alert(json.msg);
                            window.location.reload();
                        }
                    }
                })

			})
		}
	})
</script>