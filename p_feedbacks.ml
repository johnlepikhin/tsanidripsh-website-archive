
module Html = Tyxml.Html

let center =
	let script = Html.cdata_script "
		var disqus_shortname = 'tsandripsh';
		var disqus_identifier = 'testimonials';
		var disqus_url = 'http://tsandripsh-hotel.ru/feedbacks.html';
		(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	" in
	[%html
		"<div class='tpl_main_center'>
			<div id='disqus_thread'></div>
			<script>"script"</script>
		</div>"
	]

include Page.Make (struct
	let title = "Отзывы"

	let contents_name = Some "Почитайте отзывы об отдыхе у нас"

	let urls = Page.p_feedbacks

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Feedbacks ~title center
end)
