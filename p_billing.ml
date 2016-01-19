
module Html5 = Html5.M

let center = <<
	<div class="tpl_main_center">
		<h2>Номер счета для предоплаты</h2>
		<p>
			Сбербанк, карта номер <b>4276 3000 1138 3034</b>. Позвоните нам, чтобы договориться о подробностях.
		</p>

		<h2>Бронирование номеров</h2>

		<p>
			Бронирование номеров осуществляется с помощью предоплаты на наш счет в Сбербанке. Сумма составляет 2000 рублей за номер. В случае отказа от поездки, сумма предоплаты не возвращается.
			В свою очередь мы гарантируем, что забронированный на определенные даты номер останется за Вами.
		</p>

		<h2>Бронирование экскурсий</h2>

		<p>
			Бронирование экскурсий позволяет нам более точно планировать расписание поездок. В качестве благодарности, мы предоставляем скидку 100 рублей с человека на каждую предоплаченную
			экскурсию. Сумма предоплаты составляет 50% от стоимости экскурсии.
		</p>

	</div>
>>

include Page.Make (struct
	let title = "Условия бронирования"

	let contents_name = Some "Информация по предоплате и бронированию"

	let path = Page.p_billing

	let doc () = Tpl.tpl_base ~position:Tpl.Position.Prices ~title center
end)

