
module Html5 = Html5.M

let center =
	let script = Html5.cdata_script "
		var disqus_shortname = 'tsandripsh';
		var disqus_identifier = 'testimonials';
		var disqus_url = 'http://tsandripsh-hotel.ru/testimonials.html';
		(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	" in
	<<
		<div class="tpl_main_center">
			<div id="disqus_thread"/>
			<script>$script$</script>
		</div>
	>>

include Page.Make (struct
	let path = Page.p_feedbacks

	let doc = Tpl.tpl_base ~position:Tpl.Position.Feedbacks ~title:"Отзывы о нас" center
end)
