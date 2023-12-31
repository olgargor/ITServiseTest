
&НаКлиенте
Процедура ДоговорПриИзменении(Элемент)
	Если  ЗначениеЗаполнено(Объект.Контрагент) и ЗначениеЗаполнено(Объект.Договор) Тогда
	     Долг=ПолучитьСуммуВзаиморасчетовНаСервере(Объект.Контрагент,Объект.Договор);	
	КонецЕсли;
КонецПроцедуры                                  


&НаСервереБезКонтекста
Функция ПолучитьСуммуВзаиморасчетовНаСервере(Контрагент,Договор) 
	   	
	Запрос = Новый Запрос;
	Запрос.Текст = 
		"ВЫБРАТЬ
		|	ВзаиморасчетыОстатки.СуммаОстаток КАК СуммаОстаток
		|ИЗ
		|	РегистрНакопления.Взаиморасчеты.Остатки(
		|			,
		|			Контрагент = &Контрагент
		|				И Договор = &Договор) КАК ВзаиморасчетыОстатки";
	
	Запрос.УстановитьПараметр("Договор", Договор);
	Запрос.УстановитьПараметр("Контрагент", Контрагент);
	
	РезультатЗапроса = Запрос.Выполнить();
	
	Если  РезультатЗапроса.Пустой() Тогда
	   Возврат 0;
   КонецЕсли;  
   
	ВыборкаДетальныеЗаписи = РезультатЗапроса.Выбрать();
	
	ВыборкаДетальныеЗаписи.Следующий();
	Возврат ВыборкаДетальныеЗаписи.СуммаОстаток;

КонецФункции

