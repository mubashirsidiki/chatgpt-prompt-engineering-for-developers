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


# Create the chain-of-thought prompt
prompt = "Compute the age of my friend's father in 10 years, given that now he's double my friend's age, and my friend is 20. Give a step by step explanation."

response = get_response(prompt)
print(response)
