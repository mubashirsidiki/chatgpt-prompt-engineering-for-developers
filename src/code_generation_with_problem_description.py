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


# Craft a prompt that asks the model for the function
prompt = "Write a Python function that accepts a list of 12 numbers representing sales for each month of the year, and outputs the month with the highest sales value"

response = get_response(prompt)
print(response)
