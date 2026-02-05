# db/seeds.rb
puts "データの投入を開始します..."

products = []
100_000.times do |i|
  products << {
    name: "Product #{i}",
    category_code: "CAT-#{rand(1..100)}", # 1~100のランダムなカテゴリ
    created_at: Time.current,
    updated_at: Time.current
  }
end

Product.insert_all(products)
puts "データの投入が完了しました！"
