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
function = "\ndef analyze_portfolio(portfolio_data):\n  total_value = 0\n  highest_value = 0\n  lowest_value = float('inf')\n  \n  for entry in portfolio_data:\n    total_value += entry[1]\n    if entry[1] > highest_value:\n        highest_value = entry[1]\n    if entry[1] < lowest_value:\n        lowest_value = entry[1]\n\n  average_value = total_value / len(portfolio_data)\n  return highest_value, lowest_value, average_value\n  \n"

# Craft a chain-of-thought prompt that asks the model to explain what the function does
prompt = f"""Explain what the function delimited by triple backticks does. Let's think step by step
 ```{function}```
"""

response = get_response(prompt)
print(response)
