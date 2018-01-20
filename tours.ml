
module Html = Tyxml.Html

open Gallery

let img1 = Tpl_img.text_img ~right:true ~text:"Озеро Рица" (Gallery_static.Tag (riza04, Riza))
let img2 = Tpl_img.text_img ~text:"Здесь проводились первые в мире соревнования по скалолазанию" (Gallery_static.Tag (riza02, Riza))
let img3 = Tpl_img.text_img ~right:true ~text:"На том берегу дача Сталина" (Gallery_static.Tag (riza03, Riza))
let img4 = Tpl_img.text_img ~right:true ~text:"Кавказские альпы" (Gallery_static.Tag (alps04, Alps))
let img5 = Tpl_img.text_img ~text:"Вид на дорогу" (Gallery_static.Tag (alps02, Alps))
let img6 = Tpl_img.text_img ~right:true ~text:"Облака винзу" (Gallery_static.Tag (alps09, Alps))
let img7 = Tpl_img.text_img ~right:true ~text:"Новоафонский монастырь" (Gallery_static.Tag (afon_abbey02, Afon))
let img8 = Tpl_img.text_img ~text:"В пещере" (Gallery_static.Tag (cave09, Cave))
let img9 = Tpl_img.text_img ~text:"Лебединое озеро" (Gallery_static.Tag (afon02, Afon))
let img10 = Tpl_img.text_img ~right:true ~text:"Кошки и птицы мирно сосуществуют" (Gallery_static.Tag (afon03, Afon))
let img11 = Tpl_img.text_img ~text:"Железнодорожная станция расположена на прекрасном озере" (Gallery_static.Tag (afon06, Afon))
let img12 = Tpl_img.text_img ~right:true ~text:"Новоафонский монастырь" (Gallery_static.Tag (afon_abbey01, Afon))
let img13 = Tpl_img.text_img ~right:true ~text:"Панорама каньона" (Gallery_static.Tag (canyon10, Canyon))
let img14 = Tpl_img.text_img ~text:"Древний самшитовый лес" (Gallery_static.Tag (canyon03, Canyon))
let img15 = Tpl_img.text_img ~right:true ~text:"Самое начало каньона" (Gallery_static.Tag (canyon09, Canyon))

let riza =
	Page.p_tours_riza,
	"tour_riza",
	"Озеро Рица",
	"Горное озеро Рица, дача Сталина, Голубое озеро, водопад Девичьи слезы",
	[%html
		"<div>"
			[img1]
			"Озеро Рица – царица гор Абхазии – красивая и пленяющая своей загадочностью. Озеро окружено со всех сторон горами,
			поросшими густыми и порой непроходимыми лесами. Летом в июле на вершинах хребтов нередко можно встретить небольшие
			снежники – скопления снега, который еще не успел растаять. Озеро расположено на высоте 950 метров над уровнем моря
			и занимает часть долины р. Лашипсе. 
		</div>"
	],
	[%html
		"<div>
			<p><b>Экскурсия возможна с апреля по ноябрь</b></p>

			<p>
				«Оно образовалось в результате тектонического опускания долины реки на стыке двух геологических структур: известняков
				и порфиритов. Протяженность озера около 2000 м, наибольшая глубина - 150 м. Помимо Лашипсе в него впадают пять рек,
				из озера вытекает единственная река Юпшара».
			</p>

			<p>
				Восхищает и завораживает дорога до озера. Она заняла у нас полтора часа на машине от п. Цандрипш. Это было прекрасное,
				полное впечатлений путешествие.
			</p>

			<p>
				Наполненные красотой и величием скалы; высокие извилистые деревья; ясное голубое вечное небо; сильный свежий воздух
				гор, то и дело заныривающий в окошко автомобиля – всё это оставило в наших сердцах отпечатки и зарисовки великой
				одухотворенной горной страны.
			</p>

			<p>
				Вот мы проехали Голубое озеро. Как яркий голубой глаз мелькнуло оно среди серых скалистых скал – маленький алмаз
				в жесткой оправе. Вот сворот на Гегский водопад, знаменитый тем, что некогда стал одним из красивейших кулис фильма
				о Шерлоке Хомсе.
			</p>"

			[img2]

			"<p>
				Вот скалы становятся всё ближе и круче к дороге, всё массивнее кажутся нам ворота в столь удивительный и прекрасный
				мир гор и озер.
			</p>

			<p>
				И вот наша цель – место, достойное хвалы и восхищения – озеро Рица.
			</p>

			<p>
				Ровная гладь воды с изредка встречающимися барашками, потревоженными игривым ветерком. Красивые склоны горных хребтов,
				окруживших озеро словно стражники, призванные охранять царицу гор от бурь и прозорливых ветров. Здесь можно отдохнуть,
				найти уютный уголок и остаться там на несколько часов, чтоб насладиться первозданной красотой.
			</p>"

			[img3]
			"<p>
				Где из озера вытекает река Юпшара, расположились торговые ларьки и сеть кафе. Это шумное и людное место. Но это часть
				истории, только не прошлой, а настоящей. И то, как о нас будут вспоминать потомки, зависит только от нас. Поэтому
				очень хотелось, чтобы все, кто хоть когда-нибудь окажется здесь, в этом прекрасном, созданном для созерцания, тишины
				и покоя месте, поблагодарит Природу за столь ценный подарок и проникнется уважением ко всем тем, кто хранит и холит
				эту часть мира для нас – людей.
			</p>
		</div>"
	]

let alps =
	Page.p_tours_alps,
	"tour_alps",
	"Альпийские луга",
	"Альпийские луга Кавказа, увидеть снег летом, пикник над пропастью",
	[%html
		"<div>"
			[img4]
			"Сегодня мы отправились далеко в горы за 28 км. от п. Цандрипша, минуя деревню Ачмарда и летник Гюзла.
			Наш путь лежал по каменистой лесной дороге с частыми высокими обрывами в долину реки до перевала Кушонский
			(высота 2221 м.), где и была конечная точка маршрута – альпийские луга плато Арабика. Конечно же, такой длинный
			переход за день пешком не пройдешь, и мы отправились в путешествие на машине. Откосы высоких холмов, ниспадающие
			в долину горной речушки, заросли самшита, извилистых кустарников и других представителей местной флоры завораживали
			наш взгляд своей магической красотой. Небольшой водопад, встреченный нами по дороге, радостно приветствовал нас
			прохладной и вкусной водой.
		</div>"
	],
	[%html
		"<div>
			<p><b>Экскурсия возможна с июня по сентябрь</b></p>

			<p>
				И вот мы на границе леса. Проехав 26 км до лет. Гюзла, нам оставалось еще 2 км. подъема по горному серпантину.
				Занимательно наблюдать этот легкий и невидимый переход от одного высотного пояса до другого, когда лес еще есть,
				шумит над головой листва столетних деревьев и поют лесные птицы, а вот его уже нет.
			</p>

			<p>
				Через сотню метров резко начинается подъем, а древесная растительность исчезает и кажется, что кроме зеленой травы
				и редких низеньких кустарников, нет ничего. Но стоит подъехать поближе и картина преображается. Однотонный зеленый
				цвет сменяется многоцветьем, трава дополняется множеством видов цветов и злаковым разнотравьем.
			</p>"

			[img5]

			"<p>
				Наконец, впереди нас перевал. Мы были настолько вдохновлены экстремальным подъемом, что находились в состоянии
				полного восторга. И причины этому настроению, конечно же были – это и прекрасные зеленые долины альпийских лугов,
				которые цвели, играли и плескались всевозможными красками природы; это и стада диких лошадей, которые своей
				грациозностью всё больше удивляли нас и всё сильнее вспыхивало в нас чувство единения и любви к миру; это и стада
				коров, которые встречали и провожали нас насторожено. Они были не менее прекрасны, чем тот пейзаж, который
				менялся перед нашими глазами каждую минуту.
			</p>

			<p>
				Скалистый гребень перевала. Над нами простиралось удивительно большое голубое небо с мощными и властными
				облаками, которые то окутывали нас белоснежным одеялом, то отпускали навстречу зеленым просторам. Эта сила
				природа чувствовалась во всем и в слабом дуновении ветра, и в каменистых россыпях, и в плавных очертаниях
				холмов, и даже в маленьком цветке клевера, растущего на склоне. Изредка в ложбинках попадались снежники. Они
				еще не успели растаять от теплого летнего солнца, спрятавшись на северных склонах холмов. На плато нам
				встретились озера, заполняющие собой небольшие низины; вода в них дождевая и людям для питья не годиться.
				Озера представляют собой – большой мирный дом для миллиона головастиков и другой живности, а также они
				являются своеобразной поилкой для скота и диких животных.
			</p>"

			[img6]
			"<p>
				Мы гуляли, а облака играли с нами, то открывая нам бескрайние ярко-зеленые просторы, озаренные солнцем,
				то закрывая всё перед глазами белесой занавеской из мелких капель дождя.
			</p>

			<p>
				Насладившись красотой и отобедав вкусняшками, мы отправились домой в веселой и замечательной компании Минаса.
			</p>
		</div>"
	]

let afon =
	Page.p_tours_afon,
	"tour_afon",
	"Новый Афон",
	"Новый Афон, Новоафонская пещера, новоафонский монастырь",
	[%html
		"<div>"
			[img7]
			"<p>
				Новый Афон - одно из самых популярных мест Абхазии. Это маленький уютный городок, расположившийся в ущелье
				реки Псырцха у подножия двух живописных гор — Апсарской (345 м над уровнем моря) и Афонской (500 м над
				уровнем моря).
			</p>
			<p>
				Новый Афон знаменит памятниками природы, истории и архитектуры. Среди них особое место занимает Новоафонская
				пещера – сказочное и таинственное создание природы, удивляющее своим масштабом и глубиной.
			</p>
		</div>"
	],
	[%html
		"<div>"
			[img8]
			"<p><b>Экскурсия возможна круглый год</b></p>

			<p>
				Захватывающее путешествие по подземным лабиринтам, прикосновение к многовековым натечно-капельным изваяниям –
				сталагмитам, созерцание глубоких томно-голубых озер – украшений каменистых залов, переходные мостики как дорожки
				подземных рудокопов – всё это одно большое впечатление, картина, которая заняла в нашей памяти своё законное место.
			</p>"

			[img9]

			"<p>
				Грот и келья Симона Кананита – место паломничества людей разных религий и философских воззрений. Наше
				путешествие к этому столь значимому для многих верующих месту было наполнено радостью и любовью. По пути
				мы встречали людей разных мыслей и настроений, и все они несли собой покой и умиротворение.
			</p>"

			[img10]

			"<p>
				Природа вдоль дороги к гроту радовала своим изяществом и невинностью. Место, где некогда преподносил свои
				молитвы Богу святой, показалось на первый взгляд, холодным и неуютным. Но стоило очутиться внутри, подняться
				по выдолбленным в скале ступеням, как в сердце тревога сменилась радостью, теплотой и чей-то невидимой заботой.
				Спокойствие и умиротворение пришло в душу и ум. Захотелось остаться надолго, отдохнуть от суеты мирской
				обыденной жизни, поговорить мысленно с тем, кто нёс в мир свет и любовь, несмотря на все невзгоды и испытания.
				Хотелось здесь, в тайном полумраке, рассказать ему о самом сокровенном, мучающем душу, волнующем ум.
			</p>

			<p>
				Нелегко было уходить.

				Спустившись почти к самому началу тропы, мы искупались в горной речке. В холодной и сладкой воде наше омовение
				напомнило мне о таинстве крещения. И вдохновлённые высокими мыслями, мы отправились дальше.
			</p>"

			[img11]
			"<p>
				Хорошо сохранившееся здание железнодорожной станции Псырцха – великолепный памятник архитектуры, выполненный
				в виде беседки, нависающей над озером. Находясь рядом с ним, особо остро ощущаешь дух времени: старые стены,
				облупившаяся краска тлеют и исчезают в прошлое, а остается только вечное настоящее, которое и даёт нам понять
				о бессмертии души и о временности материального мира.
			</p>

			<p>
				Построенная в 1902г. монахами плотина, образовала красивое озеро Псырцха. При нашей встрече с ним, легкая дымка
				поднялась и зависла над водной поверхностью, казалось, будто река устала от дневного зноя, людского шума
				и решила укутаться в пышное и приятное наощупь одеяло из мелких капель дождя. Красивое и убаюкивающее зрелище.
			</p>

			<p>
				Шум водопада разбудил нас. Это рукотворное инженерное сооружение высотой 8, 6 м. обладало своей непревзойденной
				красотой – прямой и лаконичной. Тонкие, четкие линии водопада ассоциировались в моей душе с честностью, прямотой
				и доброжелательностью абхазского народа. Ничего лишнего, только ровная линия души.
			</p>"

			[img12]

			"<p>
				День завершался, а у нас впереди оставалось еще одно прекрасное сооружение – Новоафонский монастырь.
			</p>

			<p>
				Когда наша машина тронулась с места в сторону п. Цандрипша, еще долго слышался перезвон колоколов вечерней
				службы. Казалось, что святой монастырь дарил нам прекрасную музыку и как гостеприимный хозяин сих мест
				с любовью ждал нашего возвращения.
			</p>

		</div>"
	]

let canyon =
	Page.p_tours_canyon,
	"tour_canyon",
	"Цандрипшский каньон",
	"Цандрипшский каньон, самшитовый лес",
	[%html
		"<div>"
			[img13]
			"Путь на каньон лежит по дороге к деревне Ачмарда. Наше путешествие началось с обычной проселочной дороги через
			северо-восточную окраину Цандрипша, которая уже через десяток километров сменилась на более крутую и лесную.
			Выехав в долину и миновав несколько каменистых бродов, мы очутились в весьма экзотическом месте, поросшем
			зарослями самшита. Это были настоящие джунгли. Казалось, что Киплинг, когда писал книгу о Магули, черпал
			вдохновение в подобном сказочном царстве.
		</div>"
	],
	[%html
		"<div>"
			[img14]
			"<p><b>Экскурсия возможна с апреля по ноябрь</b></p>

			<p>
				Мхи, живущие на стволах деревьев, разрослись здесь в таком изобилии, что заполнили собой все потаённые кусочки
				леса. Ярко-зеленые, тёмно-коричневые, серебряные, черные цвета и разнообразные оттенки этого удивительного
				уголка природы рождали в голове образы заколдованных диких лесов из волшебных сказок мистера Толкиена. Здесь
				я повстречалась с местным жителем таких мест чёрной гадюкой, которая испугавшись, уплыла от меня быстрыми
				волнообразными и вполне грациозными движениями.
			</p>

			<p>
				Немного придя в себя от активных и нескучных скачек по бугристой и усыпанной булыжниками дороге,
				мы незамедлительно отправились в путь, На поиски заветного каньона.
			</p>

			<p>
				Минас и Алина настоятельно рекомендовали нам одеть легкие резиновые тапки и переодеться в купальники.
				Как оказалось впоследствии, не случайно. По пути мы присоединились к еще одной группе людей и вместе
				отправились на долгожданную встречу.
			</p>

			<p>
				Вода в горной речке — тёплая и приятного бело-зеленого цвета. Белый оттенок ей видимо придает осадок
				известковых пород, которая является основной в этой местности.
			</p>"

			[img15]

			"<p>
				Красота природы очень удивила нас. Это и свисающие со склонов ущелья кривые, поросшие разнообразной
				растительностью лиственные деревья; и светящаяся, играющая в солнечных бликах вода; и разных размеров глыбы
				камней, разбросанные по долине чьей-то гигантской рукой; и встречающиеся по пути серо-зеленые лягушки и юркие
				ящерицы. Стены каньона воплотились в образе древней крепостной стены, когда-то воздвигнутой в этих местах,
				чтобы охранять этот чудный уголок от непрошеных гостей. Но вот мы здесь. Прошло очень много времени и стены
				заросли влаголюбивой ярко-зеленой растительностью, а хозяйка этих мест устроила нам радушный прием.
			</p>

			<p>
				Потрясающая красота! Удивительное искусство природы. Вечная хозяйка сих мест — добрая, бескорыстная
				Матушка-Природа. То, что предстало перед нашими глазами, простыми словами описать невозможно. Еще один
				неповторимый уголок Абхазии останется в нашей памяти навсегда.
			</p>

			<p>
				Вернувшись на гравийный островок, мы вкусно отобедали в зарослях самшитового леса. Потом позагорали
				и обсохли. Впереди нам предстоял уже знакомый, но не менее интересный путь назад.
			</p>

		</div>"
	]


let lst = [
	riza;
	alps;
	afon;
	canyon;
]
