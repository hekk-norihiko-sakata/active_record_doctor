import random
from locust import HttpUser, task, between

class WebsiteUser(HttpUser):
    wait_time = between(1, 2)
    host = "http://web:3000"

    @task
    def search_products(self):
        code = f"CAT-{random.randint(1, 100)}"
        # nameパラメータを追加して、ログを「/products/search」で一本化する
        self.client.get(
            f"/products/search?code={code}", 
            name="/products/search (with Index)" 
        )
