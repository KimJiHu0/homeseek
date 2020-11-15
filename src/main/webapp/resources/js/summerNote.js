$(document).ready(
		function() {
			// $('#summernote').val("${board_data.BOARD_CONTENT}");
			$('.summernote').summernote(
					{
						// SummerNote의 placeholder 지정
						placeholder : '최대 2048자까지 입력할 수 있습니다.</br>' + 
									  '허위사실 기재 혹은 욕설은 관리자에 의해 제재를 당할 수 있습니다.',
						// SummerNote의 최소 height지정
						minHeight : 370,
						// SummerNote의 최대 height지정
						maxHeight : 370,
						// 언어는 한국어
						lang : 'ko-KR',
						// 사이즈는 아래와 같이.
						fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
								'18', '20', '22', '24', '28', '30', '36', '50',
								'72' ],

					});
		});
