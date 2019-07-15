<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/web/system/header.jsp" %>
	<title>图片维护</title>
</head>
<body>
<fieldset class="layui-elem-field layui-field-title" 
            style="margin: 10px;padding:15px;">
  <legend>上传图片</legend>
<div class="layui-upload">
  <button type="button" class="layui-btn layui-btn-normal" 
            id="testList">选择多文件</button> 
  <button type="button" class="layui-btn" 
            id="testListAction">提交</button>
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead><tr>
          <th>文件名</th><th>大小</th><th>状态</th><th>操作</th>
      </tr></thead>
      <tbody id="demoList"></tbody>
    </table>
  </div>
</div>   
</fieldset>

<fieldset class="layui-elem-field layui-field-title" 
            style="margin: 10px;padding:15px;">
  <legend>图片列表</legend>
  <div class="layui-upload-list">
    <table class="layui-table">
      <thead><tr>
        <th width="5%">文件名</th><th width="10%">图片</th>
        <th width="10%">操作</th>
      </tr></thead>
      <tbody id="demoList2"></tbody>
    </table>
  </div>
</fieldset>

<script type="text/javascript">
var code = '<%=request.getParameter("goodsCode")%>';
var demoListView = $('#demoList')
var uploadListIns = upload.render({
  elem: '#testList'
  ,url: con.app+'/prodpic/upload.do'
  ,data: {goodsCode:code}
  ,accept: 'images'
  ,multiple: true
  ,auto: false
  ,bindAction: '#testListAction'
  ,choose: function(obj){   
    var files = this.files = obj.pushFile(); //将每次选择的文件追加到文件队列
    //读取本地文件
    obj.preview(function(index, file, result){
      var tr = $(['<tr id="upload-'+ index +'">'
        ,'<td>'+ file.name +'</td>'
        ,'<td>'+ (file.size/1014).toFixed(1) +'kb</td>'
        ,'<td>等待上传</td>'
        ,'<td>'
          ,'<button class="layui-btn layui-btn-mini demo-reload layui-hide">重传</button>'
          ,'<button class="layui-btn layui-btn-mini layui-btn-danger demo-delete">删除</button>'
        ,'</td>'
      ,'</tr>'].join(''));
//       arrayObject.join(separator)
//       join() 方法用于把数组中的所有元素放入一个字符串。
//       元素是通过指定的分隔符进行分隔的。
// separator可选。指定要使用的分隔符。如果省略该参数，则使用逗号作为分隔符。
      
      //单个重传
      tr.find('.demo-reload').on('click', function(){
        obj.upload(index, file);
        init();
      });
      
      //删除
      tr.find('.demo-delete').on('click', function(){
        delete files[index]; //删除对应的文件
        tr.remove();
        uploadListIns.config.elem.next()[0].value = ''; //清空 input file 值，以免删除后出现同名文件不可选
      });
      
      demoListView.append(tr);
    });
  }
  ,done: function(res, index, upload){
    if(res.code == 0){ //上传成功
      init();
      var tr = demoListView.find('tr#upload-'+ index)
      ,tds = tr.children();
      tds.eq(2).html('<span style="color: #5FB878;">上传成功</span>');
      tds.eq(3).html(''); //清空操作
      return delete this.files[index]; //删除文件队列已经上传成功的文件
    }
    this.error(index, upload);
  }
  ,error: function(index, upload){
    var tr = demoListView.find('tr#upload-'+ index)
    ,tds = tr.children();
    tds.eq(2).html('<span style="color: #FF5722;">上传失败</span>');
    tds.eq(3).find('.demo-reload').removeClass('layui-hide'); //显示重传
  }
});
init();
function init(){
ajax('/prodpic/getList.do', {goodsCode:code}, 'json', function(data){
	var html = "" ;
    $.each(data.list,function(i, dom) {
        var id = dom.id;
        html+="<tr><td>"+dom.url+"</td><td>"
            +'<img src="/image/'+ dom.url +'" alt="'+ dom.url +'" class="layui-upload-img">'
            +"</td><td>"
            +"<input type='button' class='layui-btn' onclick='delPic(\""+id+"\",\""+dom.goodsCode+"\",\""+dom.url+"\")' value='删除' />&nbsp;"
            if(dom.type=='1'){
            	html+="<input type='button' class='layui-btn' onclick='void()' value='主图' />&nbsp;";
            }else{
                html+="<input type='button' class='layui-btn' onclick='setMain(\""+id+"\",\""+dom.goodsCode+"\")' value='设为主图' />&nbsp;"
            }
            html+="</td></tr>";
    });
    $("#demoList2").html(html);
})
}
function delPic(id,code,url){
	openConfirm(function(index){
        ajax('/prodpic/del.do', {id:id,goodsCode:code,url:url}, 'text', function(data){
            if (data == 1) {
                layer.msg('删除成功');
                init();
            } else {
                layer.msg('删除成功，该编号已被使用');
            }
        })
    })
}
function setMain(id,code){
	openConfirm(function(index){
        ajax('/prodpic/setMain.do', {id:id,goodsCode:code}, 'text', function(data){
            if (data == 1) {
                layer.msg('设置成功');
                init();
            } 
        })
    })
}
</script>
</body>
</html>