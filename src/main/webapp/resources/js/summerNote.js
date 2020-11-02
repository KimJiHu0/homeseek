$(document).ready(
		function() {
			// $('#summernote').val("${board_data.BOARD_CONTENT}");
			$('.summernote').summernote(
					{
						placeholder : '???',
						minHeight : 370,
						maxHeight : 370,
						focus : true,
						lang : 'ko-KR',
						fontSizes : [ '8', '9', '10', '11', '12', '14', '16',
								'18', '20', '22', '24', '28', '30', '36', '50',
								'72' ],

					});
		});
