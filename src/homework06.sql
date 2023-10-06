-- 1. Разблокировать юзеров из France и Germany с положительным балансом
db.users.updateMany(
    { country: { $in: ['France', 'Germany'] }, balance: { $gt: 0 } },
    { $unset: { is_blocked: null } }
)

-- 2. Вывести названия двух произвольных видео-роликов
db.videos.aggregate([
    { $sample: { size: 2 } },
    { $project: { title: 1, _id: 0 } }
])

-- 3. Вывести юзеров, у которых есть видео-ролики
db.users.aggregate([
    {
        $lookup: {
            from: 'videos',
            localField: '_id',
            foreignField: 'author_id',
            as: 'videos'
        }
    },
    { $match: { videos: { $ne: [] } } }
])

-- 4. Используя метод aggregate(), вывести ко-во юзеров без видео-роликов
db.users.aggregate([
    {
        $lookup: {
            from: 'videos',
            localField: '_id',
            foreignField: 'author_id',
            as: 'videos'
        }
    },
    { $match: { videos: [] } },
    { $count: 'users_count' }
])
