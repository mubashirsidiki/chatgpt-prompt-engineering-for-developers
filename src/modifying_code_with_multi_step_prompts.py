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


function = """def calculate_area_rectangular_floor(width, length):
     return width*length"""

# Craft a multi-step prompt that asks the model to adjust the function
prompt = f"""Modify the script delimited by triple backticks as follows:
             - The function should return the perimeter of the rectangular floor as well.
             - The inputs (floor dimensions) should be positive. Otherwise, appropriate error messages should be displayed.
           ```{function}```"""

response = get_response(prompt)
print(response)
