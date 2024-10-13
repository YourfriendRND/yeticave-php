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
