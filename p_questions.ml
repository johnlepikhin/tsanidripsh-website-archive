
module Html5 = Html5.M

let center =
	let script = Html5.cdata_script "
		var disqus_shortname = 'tsandripsh-questions';
		var disqus_url = 'http://tsandripsh-hotel.ru/questions.html';
		(function() {
			var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
			dsq.src = '//' + disqus_shortname + '.disqus.com/embed.js';
			(document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		})();
	" in
	<<
		<div class="tpl_main_center">
			<h1>Новое! Мы рады будем ответить на ваши вопросы прямо на сайте</h1>
			<div id="disqus_thread"/>
			<script>$script$</script>
		</div>
	>>

include Page.Make (struct
	let title = "Вопросы и ответы"

	let contents_name = Some "Задать вопрос"

	let path = Page.p_questions

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Questions ~title center
end)
