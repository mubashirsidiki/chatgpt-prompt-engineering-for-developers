import os

import openai
from dotenv import load_dotenv
from openai import OpenAI

load_dotenv()
openai.api_key = os.environ["OPENAI_API_KEY"]

# Set your API key
client = OpenAI()


def get_response(system_prompt, user_prompt):
    # Assign the role and content for each message
    messages = [
        {"role": "system", "content": system_prompt},
        {"role": "user", "content": user_prompt},
    ]
    response = client.chat.completions.create(
        model="gpt-3.5-turbo", messages=messages, temperature=0
    )

    return response.choices[0].message.content


# Try the function with a system and user prompt of your choice
response = get_response(
    "You are an expert data scientist that explains complex concepts in understandable terms",
    "Define AI",
)
print(response)
