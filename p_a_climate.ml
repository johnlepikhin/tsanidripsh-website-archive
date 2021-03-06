open Article
module Html = Tyxml.Html

let yandex_weather =
	let img1 = Html.img ~src:"http://info.weather.yandex.net/gagra/2_white.ru.png" ~alt:"" () in
	let img2 = Html.img ~src:"http://clck.yandex.ru/click/dtype=stred/pid=7/cid=1227/*http://img.yandex.ru/i/pix.gif" ~alt:"" () in
	[%html
		"<div class='weather_informer'>
			<small>Погода прямо сейчас:</small>
			<br/>
			<a href='http://clck.yandex.ru/redir/dtype=stred/pid=7/cid=1228/*http://pogoda.yandex.ru/gagra'>"
				[img1]
				[img2]
			"</a>
		</div>"
	]


let center =
	let img1 = Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.condition21, Gallery.Winter)) in
	let img2 = Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.granat_flowers, Gallery.Spring)) in
	let img3 = Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.condition16, Gallery.Summer)) in
	let img4 = Tpl_img.text_img ~right:true (Gallery_static.Tag (Gallery.condition32, Gallery.Autumn)) in
	[%html
		"<div class='tpl_main_center'>"
			[yandex_weather]
			"Для любителей точных цифр, на этой странице мы постарались максимально подробно описать климат Цандрипша, а также дать некоторые советы по поездкам. Данные по температуре
			и осадкам предоставлены фактические, по сводкам метеостанций за период 2014-2018 годов.

			<h2 class='float_clean' id='winter'>Зима</h2>
			<div class='subcolumn_right'>"
				[img1]
				"<p>
					Абхазия отличается самой мягкой зимой на всей территории. Теплая погода характерна для середины декабря
					и февраля (температура воздуха на солнце достигает отметки +18 градусов). Вечерняя прохлада зеленых
					садов и извилистых улочек курортных мест Абхазии также вас порадует в зимние месяцы, но возьмите  с собой
					теплый свитер или толстовку, тогда прогулка принесет вам теплое удовольствие. Температура воздуха в
					течение всей зимы не опускается ниже 5 градусов тепла. Снег встречается на побережье редко, а вот горы,
					обрамляющие страну, могут быть во всю усыпаны снежным покрывалом. В это время этот край по особенному
					прекрасен, сочетая в себе самые разнообразные краски зимы. 
				</p>
				<p>
					Большое обилие фруктов привнесет в ваш отдых вкусное разнообразие.  Здесь вы сможете попробовать
					мандарины, грейпфруты, апельсины, лимоны, хурму, киви, фейхоа, финики, поздние сорта яблок и груш.
					Цены значительно ниже, чем в период высокого сезона.
				</p>
				<p>
					Можно совершить экскурсию по основным достопримечательностям курортных мест, посетить серо-водородные
					источники в с. Приморское, расположенном в 7 км от Нового Афона; увидеть  Голубое озеро и озеро Рица,
					погруженных в сине-зеленые краски  зимнего очарования окаймляющих гор; стать гостем Новоафонского монастыря
					и Пещеры, Сухумского Ботанического сада и Обезьяннего питомника; расслабиться под солнышком на берегу
					Черного моря, насладиться цветением мимозы. Зимой побережье моря будет немноголюдным, а отдых — безмятежен
					и спокоен.
				</p>
			</div>
			<h3>Начало января</h3>
			<p class='small_font'>
				Минимальная температура днем 2°C<br/>
				Максимальная температура днем 13°C<br/>
				Средняя температура днём 7°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 1°C<br/>
				Максимальная температура ночью 7°C<br/>
				Средняя температура ночью 3°C<br/>
			</p>

			<p class='small_font'>
				Температура воды 11°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:54 - 16:54
			</p>

			<h3>Середина января</h3>
			<p class='small_font'>
				Минимальная температура днем 3°C<br/>
				Максимальная температура днем 14°C<br/>
				Средняя температура днём 7°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 2°C<br/>
				Максимальная температура ночью 10°C<br/>
				Средняя температура ночью 6°C<br/>
			</p>
			<p class='small_font'>
				2% общего времени грозы<br/>
				<b>27% общего времени дожди</b><br/>
				1% общего времени дожди со снегом<br/>
				1% общего времени снегопад<br/>
			</p>

			<p class='small_font'>
				Температура воды 10°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:53 - 17:04
			</p>


			
			<h3>Конец января</h3>
			<p class='small_font'>
				Минимальная температура днем 6°C<br/>
				Максимальная температура днем 17°C<br/>
				Средняя температура днём 10°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 5°C<br/>
				Максимальная температура ночью 12°C<br/>
				Средняя температура ночью 9°C<br/>
			</p>
			<p class='small_font'>
				<b>37% общего времени дожди</b><br/>
			</p>

			<p class='small_font'>
				Температура воды 10°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:48 - 17:16
			</p>


			
			<h3>Начало февраля</h3>
			<p class='small_font'>
				Минимальная температура днем 1°C<br/>
				Максимальная температура днем 16°C<br/>
				Средняя температура днём 7°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 0°C<br/>
				Максимальная температура ночью 11°C<br/>
				Средняя температура ночью 3°C<br/>
			</p>
			<p class='small_font'>
				2% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 10°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:38 - 17:31
			</p>


			
			<h3>Середина февраля</h3>
			<p class='small_font'>
				Минимальная температура днем 6°C<br/>
				Максимальная температура днем 17°C<br/>
				Средняя температура днём 11°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 5°C<br/>
				Максимальная температура ночью 12°C<br/>
				Средняя температура ночью 8°C<br/>
			</p>
			<p class='small_font'>
				15% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 9°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:26 - 17:44
			</p>


			
			<h3>Конец февраля</h3>
			<p class='small_font'>
				Минимальная температура днем 3°C<br/>
				Максимальная температура днем 16°C<br/>
				Средняя температура днём 9°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 4°C<br/>
				Максимальная температура ночью 12°C<br/>
				Средняя температура ночью 8°C<br/>
			</p>
			<p class='small_font'>
				<b>25% общего времени дожди</b><br/>
				1% общего времени дожди со снегом<br/>
			</p>

			<p class='small_font'>
				Температура воды 9°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:11 - 17:58
			</p>


			<h2 id='spring'>Весна</h2>
			<div class='subcolumn_right'>"
				[img2]
				"<p>
					Весна в Абхазии очень ранняя. Март непредсказуем в своем настроении. Он может порадовать теплой и ясной
					погодой, а может расстроить планы частыми дождями.
				</p>
				<p>
					В апреле в Абхазии устанавливается теплая погода. Температура воздуха достигает отметки 16 градусов
					тепла, а порой и поднимается до + 25.  А самое благодатное время — это конец апреля и начала мая.
					Природа вас порадует теплыми солнечными днями,а воздух прогревается до отметки  +25-27 градусов на
					солнце. Но могут выдаться дни, когда идут теплые майские дожди. Это красивое время: природа
					преобразуется и наполняется необычайными сочными красками и вкусными ароматами. 
				</p>
				<p>
					Начиная с середины мая воздух прогревается день за днем и к концу весны температура его составляет
					+28 градусов, а воды — +18.
				</p>
				<p>
					Май — прекрасное время для отдыха тех, кто не любит жару, но и в то же время мечтает принять солнечные
					ванны на берегу моря.  В мае природа преображается: цветут цитрусовые, гранаты, магнолия, рододендрон,
					олеандр, розы, ирисы и даже кактусы. Воздух наполняется удивительными ароматами. Из местных фруктов
					и ягод можно полакомиться клубникой. черешней, мандаринами и апельсинами, а в конце мая даже
					попробовать ранние персики.  
				</p>
				<p>
					Весной в Абхазии немного туристов, и это дает прекрасную возможность заказать индивидуальные туры по
					приемлемым ценам, минуя толпу, столь характерную для высокого сезона. Это замечательное время для
					знакомства с достопримечательностями древней страны. В это время особенно полезной будет поездка в
					пицундовскую сосновую рощу — уникальный памятник природы, представитель древней крымско-кавказской флоры.
					Особенность ее в выделении сосной особых веществ — фитонцидов (летучие бальзамические ароматические
					вещества), которые являются значительным лечебным фактором. Пицундская сосна выделяет их в 6-7 раз
					больше обычной сосны за счет необычно длинной хвои, что способствует  обезвреживанию болезнетворных
					бактерий. Прогулка по такой роще принесет немало пользы. Также прекрасным будет путешествие на оз. Рица. 
				</p>
				<p>
					Легкость природы, тонкие просыпающиеся ароматы цветов располагают к поездкам по многочисленным,
					будоражующим воображение природным и историческим местам. А яркие разноцветные пятна вечнозеленой
					растительности дополнят картину незабываемыми пейзажами.
				</p>
				<p>
					Теплая тишина и легкая прохлада - незабываемые спутники в это время года.
				</p>
			</div>
			<h3>Начало марта</h3>
			<p class='small_font'>
				Минимальная температура днем 9°C<br/>
				Максимальная температура днем 23°C<br/>
				Средняя температура днём 14°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 8°C<br/>
				Максимальная температура ночью 17°C<br/>
				Средняя температура ночью 12°C<br/>
			</p>
			<p class='small_font'>
				7% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 9°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:58 - 18:08
			</p>


			
			<h3>Середина марта</h3>
			<p class='small_font'>
				Минимальная температура днем 3°C<br/>
				Максимальная температура днем 18°C<br/>
				Средняя температура днём 9°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 4°C<br/>
				Максимальная температура ночью 17°C<br/>
				Средняя температура ночью 8°C<br/>
			</p>
			<p class='small_font'>
				<b>40% общего времени дожди</b><br/>
			</p>

			<p class='small_font'>
				Температура воды 9°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:41 - 18:21
			</p>


			
			<h3>Конец марта</h3>
			<p class='small_font'>
				Минимальная температура днем 1°C<br/>
				Максимальная температура днем 22°C<br/>
				Средняя температура днём 11°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 0°C<br/>
				Максимальная температура ночью 20°C<br/>
				Средняя температура ночью 9°C<br/>
			</p>
			<p class='small_font'>
				11% общего времени дожди<br/>
				1% общего времени снегопад<br/>
			</p>

			<p class='small_font'>
				Температура воды 10°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:23 - 18:33
			</p>


			
			<h3>Начало апреля</h3>
			<p class='small_font'>
				Минимальная температура днем 3°C<br/>
				Максимальная температура днем 17°C<br/>
				Средняя температура днём 11°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 1°C<br/>
				Максимальная температура ночью 16°C<br/>
				Средняя температура ночью 8°C<br/>
			</p>
			<p class='small_font'>
				12% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 10°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:03 - 18:46
			</p>


			
			<h3>Середина апреля</h3>
			<p class='small_font'>
				Минимальная температура днем 10°C<br/>
				Максимальная температура днем 27°C<br/>
				Средняя температура днём 16°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 9°C<br/>
				Максимальная температура ночью 23°C<br/>
				Средняя температура ночью 14°C<br/>
			</p>
			<p class='small_font'>
				2% общего времени грозы<br/>
				11% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 11°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:46 - 18:58
			</p>


			
			<h3>Конец апреля</h3>
			<p class='small_font'>
				Минимальная температура днем 11°C<br/>
				Максимальная температура днем 25°C<br/>
				Средняя температура днём 16°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 11°C<br/>
				Максимальная температура ночью 19°C<br/>
				Средняя температура ночью 14°C<br/>
			</p>
			<p class='small_font'>
				1% общего времени грозы<br/>
				<b>27% общего времени дожди</b><br/>
			</p>

			<p class='small_font'>
				Температура воды 12°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:29 - 19:10
			</p>


			
			<h3>Начало мая</h3>
			<p class='small_font'>
				Минимальная температура днем 12°C<br/>
				Максимальная температура днем 27°C<br/>
				Средняя температура днём 18°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 12°C<br/>
				Максимальная температура ночью 26°C<br/>
				Средняя температура ночью 16°C<br/>
			</p>
			<p class='small_font'>
				16% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 15°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:14 - 19:22
			</p>


			
			<h3>Середина мая</h3>
			<p class='small_font'>
				Минимальная температура днем 16°C<br/>
				Максимальная температура днем 31°C<br/>
				Средняя температура днём 20°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 15°C<br/>
				Максимальная температура ночью 26°C<br/>
				Средняя температура ночью 18°C<br/>
			</p>
			<p class='small_font'>
				3% общего времени грозы<br/>
				15% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 16°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:01 - 19:33
			</p>


			
			<h3>Конец мая</h3>
			<p class='small_font'>
				Минимальная температура днем 16°C<br/>
				Максимальная температура днем 30°C<br/>
				Средняя температура днём 21°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 15°C<br/>
				Максимальная температура ночью 26°C<br/>
				Средняя температура ночью 18°C<br/>
			</p>
			<p class='small_font'>
				6% общего времени грозы<br/>
				12% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 18°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 4:50 - 19:44
			</p>


			<h2 id='summer'>Лето</h2>
			<div class='subcolumn_right'>"
				[img3]
				"<p>
					Жаркое и влажное лето в Абхазии обусловлено субтропическим климатом. Если вы не переносите жару
					и едите отдыхать с маленькими детьми,то вам лучше запланировать свой отдых на июнь, сентябрь или
					даже октябрь. В это время не такая сильная жара, но достаточно теплое море. Температура воды к
					середине июня составляет 20-22 градуса, а воздух прогревается до 25-28. В это время на рынках
					можно приобрести и полакомиться такими местными фруктами и ягодами, как мушмулой, черешней,
					клубникой, персиками, сливой, ранними сортами груш, яблок, лесной земляникой, шековицей, мандаринами
					и апельсинами зимнего урожая. Нередко в садах можно увидеть несколько мандариновых деревьев, увешанных
					фруктами.
				</p>
				<p>
					Приезжая в Абхазию отдохнуть люди задумываются как провести свой отпуск. Правильно запланированный
					отдых принесет вам массу незабываемых впечатлений. Теплое и чистое море в п. Цандрипш с каждым годом
					притягивает все большее количество туристов. Для отдыхающих организуются интересные экскурсии не только
					по историческим местам, но и в глубь природы - это и поездка на цветущие альпийские луга, и катание
					на лошадях, прогулка по самшитовому лесу и каньону р. Хашупсе.
				</p>
				<p>
					Лето — это потрясающая возможность познакомиться с разнообразной природой этого удивительного края.
				</p>
				<p>
					Июль и август по статистике самые жаркие месяцы. Вода прогревается в августе и сентябре до 28 градусов.
					А температура воздуха на солнце 30-35 градусов. Это время наибольшего скопления отдыхающих на пляжах и
					в достопримечательных местах. 
				</p>
				<p>
					Из фруктов в июле можно полакомиться яблоками, грушей, персиками, лавровишней, черносливом, сливой,
					из овощей созревают перец, баклажаны, помидоры. В начале августа созревают местные дыни и арбузы,
					инжир, кизил, ежевика, а в конце августа -  виноград «Изабелла», «Дамские пальчики».
				</p>
				<p>
					Жаркий август располагает к размеренному отдыху и недолгим пешим прогулкам. Красота природы, яркое солнце
					и голубое небо - хорошие спутники для многочисленных фотосессий и хорошего настроения на протяжении всего
					путешествия.
				</p>
			</div>
			<h3>Начало июня</h3>
			<p class='small_font'>
				Минимальная температура днем 16°C<br/>
				Максимальная температура днем 30°C<br/>
				Средняя температура днём 22°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 17°C<br/>
				Максимальная температура ночью 27°C<br/>
				Средняя температура ночью 20°C<br/>
			</p>
			<p class='small_font'>
				7% общего времени грозы<br/>
				13% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 20°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 4:42 - 19:54
			</p>


			
			<h3>Середина июня</h3>
			<p class='small_font'>
				Минимальная температура днем 17°C<br/>
				Максимальная температура днем 31°C<br/>
				Средняя температура днём 23°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 15°C<br/>
				Максимальная температура ночью 27°C<br/>
				Средняя температура ночью 19°C<br/>
			</p>
			<p class='small_font'>
				10% общего времени грозы<br/>
				6% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 22°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 4:39 - 20:01
			</p>


			
			<h3>Конец июня</h3>
			<p class='small_font'>
				Минимальная температура днем 18°C<br/>
				Максимальная температура днем 29°C<br/>
				Средняя температура днём 23°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 16°C<br/>
				Максимальная температура ночью 27°C<br/>
				Средняя температура ночью 21°C<br/>
			</p>
			<p class='small_font'>
				3% общего времени грозы<br/>
				2% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 23°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 4:39 - 20:05
			</p>


			
			<h3>Начало июля</h3>
			<p class='small_font'>
				Минимальная температура днем 21°C<br/>
				Максимальная температура днем 29°C<br/>
				Средняя температура днём 25°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 20°C<br/>
				Максимальная температура ночью 27°C<br/>
				Средняя температура ночью 22°C<br/>
			</p>
			<p class='small_font'>
				13% общего времени грозы<br/>
				8% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 24°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 4:43 - 20:06
			</p>


			
			<h3>Середина июля</h3>
			<p class='small_font'>
				Минимальная температура днем 23°C<br/>
				Максимальная температура днем 36°C<br/>
				Средняя температура днём 27°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 20°C<br/>
				Максимальная температура ночью 29°C<br/>
				Средняя температура ночью 24°C<br/>
			</p>
			<p class='small_font'>
				5% общего времени грозы<br/>
				2% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 25°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 4:49 - 20:03
			</p>


			
			<h3>Конец июля</h3>
			<p class='small_font'>
				Минимальная температура днем 21°C<br/>
				Максимальная температура днем 31°C<br/>
				Средняя температура днём 26°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 20°C<br/>
				Максимальная температура ночью 29°C<br/>
				Средняя температура ночью 24°C<br/>
			</p>
			<p class='small_font'>
				7% общего времени грозы<br/>
				2% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 26°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 4:58 - 19:56
			</p>


			
			<h3>Начало августа</h3>
			<p class='small_font'>
				Минимальная температура днем 21°C<br/>
				Максимальная температура днем 34°C<br/>
				Средняя температура днём 27°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 20°C<br/>
				Максимальная температура ночью 31°C<br/>
				Средняя температура ночью 24°C<br/>
			</p>
			<p class='small_font'>
				7% общего времени грозы<br/>
				8% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 26°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:09 - 19:45
			</p>


			
			<h3>Середина августа</h3>
			<p class='small_font'>
				Минимальная температура днем 23°C<br/>
				Максимальная температура днем 33°C<br/>
				Средняя температура днём 28°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 21°C<br/>
				Максимальная температура ночью 32°C<br/>
				Средняя температура ночью 25°C<br/>
			</p>
			<p class='small_font'>
				5% общего времени грозы<br/>
				3% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 27°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:20 - 19:32
			</p>


			
			<h3>Конец августа</h3>
			<p class='small_font'>
				Минимальная температура днем 22°C<br/>
				Максимальная температура днем 31°C<br/>
				Средняя температура днём 27°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 21°C<br/>
				Максимальная температура ночью 29°C<br/>
				Средняя температура ночью 25°C<br/>
			</p>

			<p class='small_font'>
				Температура воды 26°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:31 - 19:16
			</p>


			<h2 id='autumn'>Осень</h2>
			<div class='subcolumn_right'>"
				[img4]
				"<p>
					«Здравствуйте, хмурые дни, горное солнце, прощай!» — нет, эти слова не про Абхазию. С приходом
					сентября здесь начинается «бархатный сезон» - это пора полноценного отдыха: нет изнуряющей жары,
					а море по-прежнему теплое. Этот сезон длится до конца октября-начала ноября. Температура воздуха днем
					25-28 градусов, температура воды примерно такая же. Это время богато молодым вином и фруктами. Персики,
					лимоны, инжир, киви, гранаты порадуют вас своими ароматными вкусами. Пляжи, завораживающие закаты и восходы! 
				</p>
				<p>
					Конечно в сентябре бывает и дождливая погода, но дождь всегда сменяется солнцем. Особенно вас порадует
					оз. Рица после дождя. Мягкая белая дымка на фоне золотистых гор, освещенных мягким солнцем — приятное
					и красивое зрелище. 
				</p>
				<p>
					Лето закончилось, а отдых продолжается. Разнообразие экскурсионных программ, их доступность
					привлекательна. Стоит воспользоваться возможностью посетить оздоровительные и лечебные процедуры, в
					это время они более доступны. 
				</p>
				<p>
					В ноябре становится уже значительно прохладнее. Море потихоньку остывает и его температура к середине
					месяца составляет 17 градусов. Это время не для пляжного отдыха. Но любители трекинга, горного туризма,
					велотуризма могут выбрать для себя разннобразные маршруты.
				</p>
				<p>
					К концу осени на рынках из местных фруктов появляются хурма, мандарины, апельсины, киви, фейхоа.
				</p>
				<p>
					Осень - это время ярких красок, разнообразия природы и волнующих путешествий. «Мы навсегда сохраним в
					сердце своем этот край» — а вот эти слова про Абхазию.
				</p>
			</div>
			<h3>Начало сентября</h3>
			<p class='small_font'>
				Минимальная температура днем 21°C<br/>
				Максимальная температура днем 30°C<br/>
				Средняя температура днём 26°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 20°C<br/>
				Максимальная температура ночью 28°C<br/>
				Средняя температура ночью 24°C<br/>
			</p>
			<p class='small_font'>
				12% общего времени грозы<br/>
			</p>

			<p class='small_font'>
				Температура воды 25°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:44 - 18:58
			</p>


			
			<h3>Середина сентября</h3>
			<p class='small_font'>
				Минимальная температура днем 18°C<br/>
				Максимальная температура днем 27°C<br/>
				Средняя температура днём 22°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 16°C<br/>
				Максимальная температура ночью 25°C<br/>
				Средняя температура ночью 19°C<br/>
			</p>
			<p class='small_font'>
				10% общего времени грозы<br/>
				11% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 25°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 5:55 - 18:40
			</p>


			
			<h3>Конец сентября</h3>
			<p class='small_font'>
				Минимальная температура днем 13°C<br/>
				Максимальная температура днем 28°C<br/>
				Средняя температура днём 19°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 12°C<br/>
				Максимальная температура ночью 22°C<br/>
				Средняя температура ночью 16°C<br/>
			</p>
			<p class='small_font'>
				2% общего времени грозы<br/>
				12% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 24°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:06 - 18:22
			</p>


			
			<h3>Начало октября</h3>
			<p class='small_font'>
				Минимальная температура днем 14°C<br/>
				Максимальная температура днем 23°C<br/>
				Средняя температура днём 18°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 13°C<br/>
				Максимальная температура ночью 19°C<br/>
				Средняя температура ночью 15°C<br/>
			</p>
			<p class='small_font'>
				1% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 23°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:17 - 18:03
			</p>


			
			<h3>Середина октября</h3>
			<p class='small_font'>
				Минимальная температура днем 10°C<br/>
				Максимальная температура днем 23°C<br/>
				Средняя температура днём 17°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 9°C<br/>
				Максимальная температура ночью 19°C<br/>
				Средняя температура ночью 15°C<br/>
			</p>
			<p class='small_font'>
				2% общего времени грозы<br/>
				15% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 21°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:29 - 17:46
			</p>


			
			<h3>Конец октября</h3>
			<p class='small_font'>
				Минимальная температура днем 12°C<br/>
				Максимальная температура днем 25°C<br/>
				Средняя температура днём 16°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 9°C<br/>
				Максимальная температура ночью 18°C<br/>
				Средняя температура ночью 13°C<br/>
			</p>
			<p class='small_font'>
				2% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 20°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:42 - 17:29
			</p>


			
			<h3>Начало ноября</h3>
			<p class='small_font'>
				Минимальная температура днем 4°C<br/>
				Максимальная температура днем 20°C<br/>
				Средняя температура днём 11°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 3°C<br/>
				Максимальная температура ночью 14°C<br/>
				Средняя температура ночью 8°C<br/>
			</p>
			<p class='small_font'>
				1% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 19°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 6:56 - 17:13
			</p>


			
			<h3>Середина ноября</h3>
			<p class='small_font'>
				Минимальная температура днем 8°C<br/>
				Максимальная температура днем 21°C<br/>
				Средняя температура днём 14°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 7°C<br/>
				Максимальная температура ночью 15°C<br/>
				Средняя температура ночью 11°C<br/>
			</p>
			<p class='small_font'>
				11% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 17°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:09 - 17:01
			</p>


			
			<h3>Конец ноября</h3>
			<p class='small_font'>
				Минимальная температура днем 5°C<br/>
				Максимальная температура днем 17°C<br/>
				Средняя температура днём 10°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 5°C<br/>
				Максимальная температура ночью 11°C<br/>
				Средняя температура ночью 7°C<br/>
			</p>
			<p class='small_font'>
				16% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 16°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:22 - 16:51
			</p>


			
			<h2 id='winter2'>И снова зима</h2>
			<div class='subcolumn_right'>
				<p>
					И вновь зима. Декабрь — теплый зимний месяц. Даже зимним его назвать сложно. Это некое
					продолжение осени. Те же фрукты и та же вода. Не надо шуб и теплых шарфов. Конечно свитер
					вам пригодится, но только вечером или утром, а днем температура на солнце 20-22 градуса. Тихо
					и спокойно здесь в это время. Любителям безмятежного отдыха нужно обязательно приехать
					в Абхазию в декабре. 
				</p>
				<p>
					Все больше туристов стремятся отметить Новогодние праздники именно здесь. Вас порадует не только
					разнообразные зеленые пейзажи, но и гостеприимство местных жителей. Вкусная кавказская кухня, танцы
					и веселье, местное вино и фрукты, подарки детям и интересные экскурсии — это то, что ждет Вас в
					самый многонациональный праздник в году.
				</p>
			</div>

			<h3>Начало декабря</h3>
			<p class='small_font'>
				Минимальная температура днем 4°C<br/>
				Максимальная температура днем 22°C<br/>
				Средняя температура днём 11°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 1°C<br/>
				Максимальная температура ночью 17°C<br/>
				Средняя температура ночью 7°C<br/>
			</p>
			<p class='small_font'>
				6% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 15°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:33 - 16:46
			</p>


			
			<h3>Середина декабря</h3>
			<p class='small_font'>
				Минимальная температура днем 7°C<br/>
				Максимальная температура днем 15°C<br/>
				Средняя температура днём 11°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 7°C<br/>
				Максимальная температура ночью 14°C<br/>
				Средняя температура ночью 9°C<br/>
			</p>
			<p class='small_font'>
				17% общего времени дожди<br/>
			</p>

			<p class='small_font'>
				Температура воды 13°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:43 - 16:44
			</p>


			
			<h3>Конец декабря</h3>
			<p class='small_font'>
				Минимальная температура днем 4°C<br/>
				Максимальная температура днем 19°C<br/>
				Средняя температура днём 10°C
			</p>

			<p class='small_font'>
				Минимальная температура ночью 5°C<br/>
				Максимальная температура ночью 18°C<br/>
				Средняя температура ночью 8°C<br/>
			</p>
			<p class='small_font'>
				1% общего времени грозы<br/>
				<b>32% общего времени дожди</b><br/>
			</p>

			<p class='small_font'>
				Температура воды 12°C
			</p>
			<p class='small_font'>
				Время восхода и заката солнца 7:50 - 16:47
			</p>


		</div>"
	]

let left =
	[%html{|
		<aside>
			<h2>Оглавление</h2>
			<p><a href="#winter">Зима</a></p>
			<p><a href="#spring">Весна</a></p>
			<p><a href="#summer">Лето</a></p>
			<p><a href="#autumn">Осень</a></p>
			<p><a href="#winter2">И снова зима</a></p>
		</aside>
	|}]


let tsandripsh = make ~urls:Page_common.a_climate ~title:"Климат Цандрипша" ~left center

