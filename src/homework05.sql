-- 1. Вывести ко-во незаблокированных юзеров не из Germany
db.users.aggregate([
    { $match: { is_blocked: { $ne: true }, country: { $ne: 'Germany' } } },
    { $count: 'users_unblocked_count' }
])

-- 2. Вывести имена юзеров не из Germany
db.users.aggregate([
    { $match: { country: { $ne: 'Germany' } } },
    { $project: { fullname: 1, _id: 0 } }
])

-- 3. Уменьшить баланс заблокированных юзеров на 5%
db.users.updateMany(
    { is_blocked: true },
    { $mul: { balance: .95 } }
)

-- 4. Вывести название треков продолжительностью от 1 до 10 мин
db.videos.aggregate([
    { $match: { duration_secs: { $gte: 1 * 60, $lte: 10 * 60 } } },
    { $project: { title: 1, _id: 0 } }
])

-- 5. Разблокировать юзеров из France
db.users.updateMany(
    { country: 'France' },
    { $unset: { is_blocked: null } }
)
