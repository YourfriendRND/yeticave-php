-- Восстановление исходных данных в Базе Данных --

CREATE TABLE categories (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

INSERT INTO categories (
    name
) VALUES ('Доски и лыжи'),
('Крепления'),
('Ботинки'),
('Одежда'),
('Инструменты'),
('Разное');

CREATE TABLE users (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR (120) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    contact_data TEXT,
    avatar_link TEXT,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

INSERT INTO users (
    name,
    email,
    password_hash,
    contact_data,
    avatar_link
) VALUES 
('Коля Паштет', 'pashtet_43@mail.ru', '41f0376ebe9cba4fd548959662b2c04bc8600e91c28c71a5cdeb4701646e8fab', '937-99-92 звоните и найдете', 'https://media.istockphoto.com/id/1451002406/ru/фото/портрет-пожилого-мужчины-в-бассейне.jpg?s=612x612&w=0&k=20&c=0YOMklkuC1Jeeh5uq0emNde7XNRh2k1yFXmhkTbNWZ0='),
('Саня Черный', 'alex-black-47@inbox.ru', '9f3f78f7cb66c84f84e91e75463161870098846e4578491429b0b79901253f22', 'skype: alex_black_star', 'https://media.istockphoto.com/id/1296158947/ru/фото/портрет-творческого-модного-черного-африканского-дизайнера-мужчины-смеется.jpg?s=612x612&w=0&k=20&c=P_EFxbJASiELO2ptc6I-_u3i96Qseujp3QHRGzWN-kc='),
('Лиза Дудка', 'dudko_right@yandex.ru', '0fdd1b8418555752baa2614f624b8421cb7f6a8c0afb7698bbe1659b918f29d3', 'Пишите в телегу @dudochka_suks', 'https://media.istockphoto.com/id/1339629603/ru/фото/портрет-зрелой-женщины-дома.jpg?s=612x612&w=0&k=20&c=Vbcqtguvde22vAFloJkBMPQIHG94s5xFntameDrNiC0='),
('Галя Борщева', 'borsch-red64@mail.ru', '3662b24290caeed4050d9813affc6ae55be78e46b7c02e446e13ebe5a6c1141c', 'Доступна только по email: borsch-red64@mail.ru', 'https://media.istockphoto.com/id/1392823310/ru/фото/красочные-волосы-не-ухаживают.jpg?s=612x612&w=0&k=20&c=tIZJL5qqiHKS7bAH8CBi5EPrU6Msx3TP-PSrgMCEy84='),
('Дмитрий Быдлоглазов', 'borzy228@rambler.ru', '49065f6216cbd98efef597cbe79cb73793d4c9f15c537b335018703cbb8e2518', 'Пиши смски на мой номер +79453235455', 'https://media.istockphoto.com/id/1155183414/ru/фото/портрет-китайского-бизнесмена-в-творческом-кабинете.jpg?s=612x612&w=0&k=20&c=Ll4n_U23Cd9pOp6c4UJ4DV215-EeSSwL8snY1PNJOIM='),
('Ксюша Кошкина', 'small_kitty@gmail.com', 'c8b7bcf6354cce2f5106d07680c85ecde2855102ffdeafadb42f7984ef8a903b', 'Hi there! I''m using what''s app +7965738223', 'https://media.istockphoto.com/id/685132229/ru/фото/businesswoman-with-curly-hair-over-white.jpg?s=612x612&w=0&k=20&c=vz2f3Mk16_p2DZz7hCdXhIcTGwYsRjCOf5jsx5DxBGw=');

CREATE TABLE lots (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(120) NOT NULL,
    description TEXT NOT NULL,
    min_rate DECIMAL(10, 2) NOT NULL CHECK(min_rate > 0),
    active_until TIMESTAMP NOT NULL,
    image_link TEXT NOT NULL,
    user_id INTEGER NOT NULL,
    category_id INTEGER NOT NULL,
    win_rate_id INTEGER,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

ALTER TABLE lots ADD FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE lots ADD FOREIGN KEY (`category_id`) REFERENCES categories(`id`) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO lots (
    name,
    description,
    min_rate,
    active_until,
    image_link,
    user_id,
    category_id
) VALUES
(
    'DC Ply Mens 2016/2017 Snowboard', 
    'Легкий маневренный сноуборд, готовый дать жару в любом парке, растопив снег мощным щелчком и четкими дугами. Стекловолокно Bi-Ax, уложенное в двух направлениях, наделяет этот снаряд отличной гибкостью и отзывчивостью, а симметричная геометрия в сочетании с классическим прогибом кэмбер позволит уверенно держать высокие скорости. А если к концу катального дня сил совсем не останется, просто посмотрите на Вашу доску и улыбнитесь, крутая графика от Шона Кливера еще никого не оставляла равнодушным.',
    3500, 
    '2024-11-28', 
    'https://images.evo.com/imgp/700/105547/476404/dc-ply-snowboard-2017-.jpg', 
    1, 
    1
),
(
    'Куртка-анорак сноубордическая DC Shoes Dc-43 Anorak M Snjt Angled Tie Dye Sulphur Spring', 
    'Сноубордический анорак DC Shoes DC-43 изготовлен из прочного и износостойкого полиэстера, мембрана Weather Defense 10K защищает от влаги и отлично дышит. Имеет множество функциональных карманов, регулируемый объемный капюшон, который можно надеть на шлем. А вентиляционные отверстия и проклеенные швы добавят комфорта во время длительного катания.',
    6700,
    '2024-12-15',
    'https://www.kant.ru/upload/iblock/5eb/5ebe73c4bcc758e041d19c734dec1715.jpg',
    2, 
    4
),
(
    'Брюки Salewa ella 3L Ptx W Black Out', 
    'Salewa ella - легкие, полностью водонепроницаемые, ветрозащитные и дышащие технические брюки хардшелл для лыжного туризма. Легкая, полностью водонепроницаемая (20 000 мм) и ветрозащитная 3-слойная ламинированная ткань Powertex с герметичными швами и водостойкими молниями обеспечивает защиту от непогоды в суровые дни, но при этом предлагает высокий уровень воздухопроницаемости (20 000 г/м2/24 ч) для подъемов и спусков. ',
    12000, 
    '2024-12-17', 
    'https://www.kant.ru/upload/resize_cache/iblock/c9d/1500_1500_1/c9d6e617282c7fc07e4c24129d9b9d53.jpg', 
    3,
    4
),
(
    'Крепления Union Contact Pro 2015 года размер L/XL',
    'Крепление для сноуборда UNION CONTACT PRO - это универсальные крепления, созданные для паркового сноубординга и катания по трассам. Они идеально подойдут сноубордистам, которым нужна свобода действий и высокий контроль доски.',
    2300,
    '2024-12-10',
    'https://boardpoint.ru/upload/iblock/0b1/iw5isfega21z1f7xq9wg1dyd6ukq208m.jpg',
    4,
    2
),
(
    'Ботинки Salewa Ortles Ascent Mid Gtx W Syrah/Black',
    'Salewa Ortles Ascent Mid Gore-Tex® — надежные ботинки для альпинизма в сложных условиях длительных восхождений. Верх из толстой замши, система SALEWA® 3F со стальными тросами и усиленный резиновый рант делают ботинки исключительно прочными и долговечными, а жесткая промежуточная подошва из нейлона, усиленная карбоном и стекловолокном, повышает устойчивость при передвижении по особо сложному рельефу. Конструкция с двухслойной промежуточной подошвой из вспененного полиуретана обеспечивает как комфорт, так и точность, а система Multi Fit Footbed Plus (MFF+) позволяет настроить посадку обуви для индивидуального комфорта.',
    15000,
    '2025-01-01',
    'https://www.kant.ru/upload/iblock/333/33391e251f6768986cd2ed27be3ac071.jpg',
    5,
    3
),
(
    'Маска горнолыжная SCOTT React Ls Mineral White Light Sensitive Red Chrome',
    'Маска SCOTT React LS отличается непревзойденной универсальностью. Модель оснащена двумя передовыми линзами на любую погоду. Основная линза с технологией AMP LS автоматически подстраивается под условия освещения. Вторая линза оснащена новейшей технологией AMP Pro от SCOTT. Ее натуральный зеленый оттенок фильтра улучшает контрастность в условиях плохой видимости, сохраняя при этом точность цвета и снижая утомляемость глаз Продуманная конструкция маски обеспечивает сверхширокий обзор, а так же идеальный комфорт и посадку благодаря трехслойной пене из микрофибры. Кроме того, магнитная система делает процесс смены линз интуитивно понятным, безопасным и простым даже в перчатках..',
    13500,
    '2024-12-07',
    'https://www.kant.ru/upload/iblock/2de/2dedccb167eb720610323e0d1d459be6.JPG',
    6,
    6
),
(
    '2014 Rossignol District Snowboard',
    'DISTRICT - один из наших лучших (и бюджетных) вариантов для начинающих райдеров, которые хотят развиваться во фристайле. Это очень удобная и простая в управлении доска, прогресс на которой не заставит себя ждать. Выраженный рокер по технологии AmpTek придаст уверенности и снизит вероятность словить канта, задавливая прессы на боксах или приземляя очередное вращение.',
    5000,
    '2024-12-01',
    'https://www.snowsurf.com/media/Snowboard_2014/img/rossignol_2014_district_amptek__prop_1000x604.jpg',
    5,
    1
),
(
    'Лопата Naturehike Multifunctional Outdoor Shovel Silver',
    'Многофункциональная лопата Naturehike Multifunctional outdoor shovel сильно облегчает туристический быт, объединяя в себе необходимые для выживания приспособления. Это прочная и надёжная лопата, в основе которой – качественные и износостойкие материалы. А именно: специальная сталь марки 3Cr13, сплав алюминия, углеродная сталь, магниевый стержень.',
    2800,
    '2025-01-13',
    'https://www.kant.ru/upload/resize_cache/iblock/fe5/1500_1500_1/fe5a9b5c7f21c053e1b165867938ea14.JPG',
    4,
    5
),
(
    'Топор Tramp туристический 14"',
    'Универсальный туристический топор Tramp станет незаменимым помощником в походе, на рыбалке или отдыхе на природе. С его помощью вы легко нарубите ветки для костра, а компактный и удобный для транспортировки размер позволяет легко разместить его в туристический рюкзаке. Прочная рукоятка удобно лежит в руке и оснащена резиновыми вставками, которые предотвращают скольжение инструмента в руках даже при сильном замахе. Для безопасной транспортировки предусмотрен пластиковый чехол.',
    1400,
    '2025-01-10',
    'https://www.kant.ru/upload/resize_cache/iblock/e0e/1500_1500_1/e0e831040eba8c21fcd4c318e5197255.jpg',
    3,
    5
),
(
    'Ботинок для сноуборда Atom Freemind Black/Aquamarine, год 2023, размер 40',
    'Atom Freemind - это доступные по цене и достаточно комфортные ботинки для сноубординга, разработанные специально для девушек. Универсальный ботинок подходит для планомерного освоения различных стилей катания. Freemind сшиты из качественной синтетической кожи со вставками из водостойкого текстиля. Внутренний сапожок идеально повторяет контуры ступни и не сковывает движений пальцев, затяжка регулируется при помощи удобной шнуровки с фиксатором. ',
    11645,
    '2024-12-12',
    'https://avatars.mds.yandex.net/get-mpic/12306721/2a0000018becbe047fca7ff419dff7aa8fd0/900x1200',
    2,
    3
);

CREATE TABLE rates (
    id INTEGER PRIMARY KEY AUTO_INCREMENT,
    rate DECIMAL(10, 2) NOT NULL CHECK(rate > 0),
    lot_id INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP() ON UPDATE CURRENT_TIMESTAMP()
);

ALTER TABLE rates ADD FOREIGN KEY (`user_id`) REFERENCES users(`id`) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE rates ADD FOREIGN KEY (`lot_id`) REFERENCES lots(`id`) ON UPDATE CASCADE ON DELETE CASCADE;

INSERT INTO rates (rate, lot_id, user_id)
VALUES 
(4000, 1, 2),
(4100, 1, 3),
(4700, 1, 4),
(5000, 1, 5),
(6000, 1, 6),
(7000, 2, 1),
(7500, 2, 3),
(8000, 2, 4),
(8500, 2, 5),
(9000, 2, 6),
(13000, 3, 1),
(14000, 3, 2),
(15000, 3, 4),
(16000, 3, 5),
(17000, 3, 6),
(2400, 4, 1),
(2500, 4, 2),
(2650, 4, 3),
(2700, 4, 5),
(3000, 4, 6),
(15500, 5, 1),
(17000, 5, 2),
(18000, 5, 3),
(20000, 5, 4),
(22000, 5, 6),
(14000, 6, 1),
(14200, 6, 2),
(14800, 6, 3),
(15350, 6, 4),
(16000, 6, 5),
(5400, 7, 1),
(5800, 7, 2),
(6700, 7, 3),
(7000, 7, 4),
(7500, 7, 6),
(2900, 8, 1),
(3000, 8, 2),
(3100, 8, 3),
(3200, 8, 5),
(3350, 8, 6),
(1500, 9, 1),
(1800, 9, 2),
(2000, 9, 4),
(2200, 9, 5),
(2500, 9, 6),
(11800, 10, 1),
(12000, 10, 3),
(12500, 10, 4),
(13500, 10, 5),
(14000, 10, 6);

ALTER TABLE lots ADD FOREIGN KEY (`win_rate_id`) REFERENCES rates(`id`) ON DELETE RESTRICT;
