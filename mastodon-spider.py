#!/usr/bin/env python

from mastodon import Mastodon
from datetime import datetime, timedelta, timezone
import os
from dotenv import load_dotenv
from html import unescape
import re

load_dotenv()

MASTODON_API_BASE_URL = 'https://mastodon.social'
CLIENT_ID = os.getenv('CLIENT_ID')
CLIENT_SECRET = os.getenv('CLIENT_SECRET')
ACCESS_TOKEN = os.getenv('ACCESS_TOKEN')

# Initialize Mastodon API
mastodon = Mastodon(
    client_id=CLIENT_ID,
    client_secret=CLIENT_SECRET,
    access_token=ACCESS_TOKEN,
    api_base_url=MASTODON_API_BASE_URL
)

def clean_html(raw_html):
    return re.sub(r'<[^>]+>', '', unescape(raw_html))

def spider_posts(days=7):
    try:
        user = mastodon.account_verify_credentials()
        user_id = user['id']

        all_posts = []
        max_id = None
        cutoff_date = datetime.now(timezone.utc) - timedelta(days=days)

        while True:
            posts = mastodon.account_statuses(user_id, max_id=max_id, limit=40)
            if not posts:
                break

            for post in posts:
                if post['created_at'] < cutoff_date:
                    break
                all_posts.append(post)

            if post['created_at'] < cutoff_date:
                break

            max_id = posts[-1]['id']

        with open(f'mastodon_posts_{datetime.now().strftime("%Y%m%d")}.md', 'w', encoding='utf-8') as file:
            file.writelines(f"---\n\n{post['created_at']}\n\n{clean_html(post['content'])}\n\n" for post in all_posts)

        print(f"Successfully spidered and saved {len(all_posts)} posts from the last {days} days as Markdown.")
    except Exception as e:
        print(f"An error occurred: {e}")

def main():
    spider_posts()

if __name__ == "__main__":
    main()
