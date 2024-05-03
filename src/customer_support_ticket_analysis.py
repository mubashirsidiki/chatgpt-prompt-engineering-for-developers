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
ticket_1 = "Hi there! My name is John Smith, and I am experiencing issues with your premium software, XYZ Pro. My license key is ABC12345. I purchased it last week, but it's not activating properly on my computer."
ticket_2 = "Dear support team, I am writing to inquire about the delivery status of my order. My name is Jane Doe, and I placed an order for a laptop on your website two days ago. The order number is ORD56789. Can you please provide an update on the delivery?"
ticket_3 = "Hello, I am having trouble accessing my account on your mobile app. My name is Alex Johnson, and I have a subscription for your Gold Plan. Can you help me resolve this issue?"
ticket_4 = "Greetings, I am facing technical difficulties with your software, ABC Editor. My name is Sarah Lee, and I recently upgraded to the latest version. However, whenever I try to save my work, the software crashes. Can you please help me resolve this problem?"
entities_1 = "\n* Customer Details:\n  - Name: John Smith\n  - License Key: ABC12345\n* Product/Service Mentions:\n  - Product: XYZ Pro (premium software)\n"
entities_2 = "\n* Customer Details:\n  - Name: Jane Doe\n* Product/Service Mentions:\n  - Product: laptop"
entities_3 = "\n* Customer Details:\n  - Name: Alex Johnson\n* Product/Service Mentions:\n  - Product: mobile app\n  - Service: Gold Plan"

# Craft a few-shot prompt to get the ticket's entities
prompt = f"""Ticket: {ticket_1} -> Entities: {entities_1}
            Ticket: {ticket_2} -> Entities: {entities_2}
            Ticket: {ticket_3} -> Entities: {entities_3}
            Ticket: {ticket_4} -> Entities: """

response = get_response(prompt)
print("Ticket: ", ticket_4)
print("Entities: ", response)
