function changeReadStatus() {

	const humanizer = {
		'true': 'read',
		'false': 'unread'
	}

	const dataizer = {
		'true': false,
		'false': true
	}

	function changeStatusOfLink(id_of_link, new_status) {
		$.ajax({
			type: 'PATCH',
			url:  '/api/v1/links/' + id_of_link,
			data: {
				link: {
					read: new_status
				}
			},
			success: function() {
				var modifyLink = $("[data-id=" + id_of_link + "]");
				modifyLink.toggleClass('read');
				modifyLink.attr('data-read', `${new_status}`);
				var button = $(modifyLink.children('button'));
				button.prop('innerText', `Mark as ${humanizer[new_status]}`);
				button.one('click', function () {
					changeStatusOfLink(id_of_link, !new_status);
				});
			}
		});
	}

	$('.status-change').each( function (index, button) {
		$(button).one('click', function () {
			changeStatusOfLink($(button).parent().attr('data-id'), dataizer[$(button).attr('data-read')]);
		});
	})
}