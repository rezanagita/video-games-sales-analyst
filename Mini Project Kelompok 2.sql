--Mengganti nama tabel

ALTER TABLE public.vgsales_clean
RENAME COLUMN "Global_Sales" TO "Global_Sales_(Million_copy)"

ALTER TABLE public.vgsales_clean
RENAME COLUMN "JP_Sales" TO "JP_Sales_(Million_copy)";

ALTER TABLE public.vgsales_clean
RENAME COLUMN "EU_Sales" TO "EU_Sales_(Million_copy)";

ALTER TABLE public.vgsales_clean
RENAME COLUMN "Other_Sales" TO "Other_Sales_(Million_copy)";

ALTER TABLE public.vgsales_clean
RENAME COLUMN "NA_Sales" TO "NA_Sales_(Million_copy)";
select * from public.vgsales_clean

--melihat 10 penjualan paling tinggi 

select "Global_Sales_(Million_copy)", "Name", "Publisher" ,"Genre"
from public.vgsales_clean
limit 5;

--Melihat platform yanng paling banyak terjual
select
    "Platform",
    COUNT(*) AS total_game_terjual
from public.vgsales_clean
group by "Platform"
order by total_game_terjual DESC
limit 10;

--jumlah penjualan berdasarakan genre tahun 2002
select "Genre", count(*) as jumlah_genre
from public.vgsales_clean
where ("Year"='2002')
group by "Genre"
order by jumlah_genre desc
limit 10;

--penjualan di amerika 
select "Name","Genre","NA_Sales_(Million_copy)"
from public.vgsales_clean
order by "NA_Sales_(Million_copy)" desc
limit 10;

--penjualan di eropa 
select "Name","Genre","EU_Sales_(Million_copy)"
from public.vgsales_clean
order by "EU_Sales_(Million_copy)" desc
limit 10;

--penjualan di jepang 
select "Name","Genre","JP_Sales_(Million_copy)"
from public.vgsales_clean
order by "JP_Sales_(Million_copy)" desc
limit 10;

--penjualan global setiap tahun
select "Year", 
	sum("Global_Sales_(Million_copy)") as total_sales
from public.vgsales_clean
group by "Year"
order by "Year" asc;

--berapa total video game yang dikeluarkan oleh publisher
SELECT 
    "Publisher",
    COUNT("Name") AS total_game
FROM public.vgsales_clean
GROUP BY "Publisher"
ORDER BY total_game DESC
LIMIT 10;

--berapa jumlah video game per genre yang dikeluarkan di tahun 2008
SELECT 
    "Genre", 
    COUNT(*) AS Jumlah_Game
FROM 
    public.vgsales_clean
WHERE 
    "Year" = 2008
GROUP BY 
    "Genre"
ORDER BY 
    Jumlah_Game DESC
LIMIT 5;