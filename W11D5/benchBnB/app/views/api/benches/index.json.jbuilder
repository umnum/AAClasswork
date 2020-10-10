json.bench do
    @benches.each do |bench|
        json.set! bench.id do
            json.extract! bench, :id, :description, :lat, :lng
        end
    end
end