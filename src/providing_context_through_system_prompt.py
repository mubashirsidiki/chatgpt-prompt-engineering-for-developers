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


# added/edited
service_description = "\nWelcome to MyPersonalDelivery, your trusted and versatile delivery service partner. At MyPersonalDelivery, we are committed to providing you with a seamless and efficient delivery experience for a wide range of items. Whether you need groceries, documents, electronics, or even furniture, we've got you covered.\n\nOur Services:\nWe offer a diverse range of delivery services to cater to your unique needs. From same-day delivery for urgent items to scheduled deliveries that fit your convenience, we have the flexibility to meet your busy lifestyle. Our real-time tracking system ensures that you can monitor the status of your delivery every step of the way.\n\nWhat We Deliver:\nOur service is designed to handle various items, including everyday essentials such as groceries and medications. Need to send important documents? No problem, we'll ensure they reach their destination securely. We also specialize in transporting larger items like electronics, clothing, and even furniture. However, please note that we currently do not offer delivery for hazardous materials or items that are extremely fragile and require special handling.\n\nSafety and Care:\nYour items' safety is our top priority. We take pride in our secure handling practices to ensure that your deliveries arrive intact. Our contactless delivery option minimizes physical contact, adding an extra layer of safety during these times. We understand that each item is valuable, and you can trust us to treat your belongings with the utmost care.\n\nWhy Choose MyPersonalDelivery:\n- Wide variety of items delivered\n- Flexible delivery options\n- Real-time tracking for peace of mind\n- Secure handling and contactless delivery\n- Reliable service with a commitment to excellence\n\nWhether you need a small package delivered across town or a larger item transported across the city, you can rely on MyPersonalDelivery to provide a reliable, secure, and efficient delivery solution. Your satisfaction is our driving force, and we look forward to serving you with our dedicated and customer-centric approach.\n\nFeel free to ask any questions you may have about our services, and we'll be more than happy to assist you.\n\n"

# Define the system prompt
system_prompt = f"""You are a customer service chatbot for MyPersonalDelivery whose service description is delimited by triple backticks. You should respond to user queries in a gentle way.
 ```{service_description}```
"""

user_prompt = "What benefits does MyPersonalDelivery offer?"

# Get the response to the user prompt
response = get_response(system_prompt, user_prompt)

print(response)
