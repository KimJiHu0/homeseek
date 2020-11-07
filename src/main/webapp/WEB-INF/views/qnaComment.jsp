<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
var qna_no = '${dto.qna_no}'; //게시글 번호
 
$('[name=commentInsertBtn]').click(function(){ //댓글 등록 버튼 클릭시 
    var insertData = $('[name=commentInsertForm]').serialize(); //commentInsertForm의 내용을 가져옴
    commentInsert(insertData); //Insert 함수호출(아래)
});
 
 
 
//댓글 목록 
function commentList(){
    $.ajax({
        url : 'commentlist.do',
        type : 'get',
        data : {'qna_no':qna_no},
        success : function(data){
            var a =''; 
           
            $.each(data, function(key, comment){ //체크............................
                a += '<div class="commentArea" style="border-bottom:1px solid darkgray; margin-bottom: 15px;">';
                a += '<div class="commentInfo'+comment.comm_no+'">'+' ID : '+comment.comm_id+'\tTIME : '+comment.comm_regdate+'\t';
                a += '<a onclick="commentUpdate('+comment.comm_no+',\''+comment.comm_content+'\');">   수정 </a>';
                a += '<a onclick="commentDelete('+comment.comm_no+');">  삭제 </a> </div>';
                a += '<div class="commentContent'+comment.comm_no+'"> <p> 내용 : '+comment.comm_content +'</p>';
                a += '</div></div>';
            });
            
            $(".commentList").html(a);
        }
    });
}
 
//댓글 등록
function commentInsert(insertData){
    $.ajax({
        url : 'commentinsert.do',
        type : 'post',
        data : insertData,
        success : function(data){
            if(data == 1) {
                commentList(); //댓글 작성 후 댓글 목록 reload
                $('[name=comm_content]').val('');
            }
        }
    });
}
 
//댓글 수정 - 댓글 내용 출력을 input 폼으로 변경 
function commentUpdate(comm_no, comm_content){
    var a ='';
    
    a += '<div class="input-group">';
    a += '<input type="text" class="form-control" name="comm_content_'+comm_no+'" value="'+comm_content+'"/>';//체크!!
    a += '<span class="input-group-btn"><button class="btn btn-default" type="button" onclick="commentUpdateProc('+comm_no+');">수정</button> </span>';
    a += '</div>';
    
    $('.commentContent'+comm_no).html(a);
    
}
 
//댓글 수정
function commentUpdateProc(comm_no){
    var updateContent = $('[name=comm_content_'+comm_no+']').val();//체크!!
    
    $.ajax({
        url : 'commentupdate.do',
        type : 'post',
        data : {'comm_content' : updateContent, 'comm_no' : comm_no},
        success : function(data){
            if(data == 1) commentList(qna_no); //댓글 수정후 목록 출력 
        }
    });
}
 
//댓글 삭제 
function commentDelete(comm_no){
    $.ajax({
        url : 'commentdelete.do',
        type : 'post',
        data : {'comm_no' : comm_no},
        success : function(data){
            if(data == 1) commentList(qna_no); //댓글 삭제후 목록 출력 
        }
    });
}
 
 
 
 
$(document).ready(function(){
    commentList(); //페이지 로딩시 댓글 목록 출력 
});
 
 
</script>
