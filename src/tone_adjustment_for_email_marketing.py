import os

import openai
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
openai.api_key = os.environ["OPENAI_API_KEY"]

# Set your API key
client = OpenAI()


def get_response(prompt):
    messages = [{"role": "user", "content": prompt}]
    response = client.chat.completions.create(
        model="gpt-3.5-turbo",
        messages=messages,
        temperature=0,
    )
    return response.choices[0].message.content


# added/edited
sample_email = "\nSubject: Check out our latest products!\n\nDear Customer,\n\nWe are excited to introduce our latest product line that includes a wide range of items to suit your needs. Whether you're looking for electronics, home appliances, or fashion accessories, we have it all!\n\nHurry and visit our website to explore the fantastic deals and discounts we have for you. Don't miss out on the opportunity to get the best products at unbeatable prices.\n\nThank you for being a valued customer, and we look forward to serving you soon!\n\nBest regards,\nThe Marketing Team\n"

# Craft a prompt to change the email's tone
prompt = f"""
Write the email delimited by triple backticks using a professional, positive, and user-centric tone:
 ```{sample_email}```
"""

response = get_response(prompt)
print("Before transformation: \n", sample_email)
print("After transformation: \n", response)
