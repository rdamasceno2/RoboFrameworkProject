from robot.libraries.BuiltIn import BuiltIn
import requests

ADDCUSTOMER_HEADER_LABEL = "Add Customer"
ADDCUSTOMER_EMAIL_TEXTBOX = "id=EmailAddress"
ADDCUSTOMER_FIRST_NAME_TEXTBOX = "id=FirstName"
ADDCUSTOMER_LAST_NAME_TEXTBOX = "id=LastName"
ADDCUSTOMER_CITY_TEXTBOX = "id=City"
ADDCUSTOMER_STATE_DROPDOWN = "id=StateOrRegion"
ADDCUSTOMER_GENDER_RADIO = "gender"
ADDCUSTOMER_PROMO_CHECKBOX = "name=promos-name"
ADDCUSTOMER_SUBMIT_BUTTON = "Submit"

states = {
    'AK': 'Alaska',
    'AL': 'Alabama',
    'AR': 'Arkansas',
    'AS': 'American Samoa',
    'AZ': 'Arizona',
    'CA': 'California',
    'CO': 'Colorado',
    'CT': 'Connecticut',
    'DC': 'District of Columbia',
    'DE': 'Delaware',
    'FL': 'Florida',
    'GA': 'Georgia',
    'GU': 'Guam',
    'HI': 'Hawaii',
    'IA': 'Iowa',
    'ID': 'Idaho',
    'IL': 'Illinois',
    'IN': 'Indiana',
    'KS': 'Kansas',
    'KY': 'Kentucky',
    'LA': 'Louisiana',
    'MA': 'Massachusetts',
    'MD': 'Maryland',
    'ME': 'Maine',
    'MI': 'Michigan',
    'MN': 'Minnesota',
    'MO': 'Missouri',
    'MP': 'Northern Mariana Islands',
    'MS': 'Mississippi',
    'MT': 'Montana',
    'NA': 'National',
    'NC': 'North Carolina',
    'ND': 'North Dakota',
    'NE': 'Nebraska',
    'NH': 'New Hampshire',
    'NJ': 'New Jersey',
    'NM': 'New Mexico',
    'NV': 'Nevada',
    'NY': 'New York',
    'OH': 'Ohio',
    'OK': 'Oklahoma',
    'OR': 'Oregon',
    'PA': 'Pennsylvania',
    'PR': 'Puerto Rico',
    'RI': 'Rhode Island',
    'SC': 'South Carolina',
    'SD': 'South Dakota',
    'TN': 'Tennessee',
    'TX': 'Texas',
    'UT': 'Utah',
    'VA': 'Virginia',
    'VI': 'Virgin Islands',
    'VT': 'Vermont',
    'WA': 'Washington',
    'WI': 'Wisconsin',
    'WV': 'West Virginia',
    'WY': 'Wyoming'
}


def add_new_customer_via_python(email, first_name, last_name, city, state, gender):
    selenium_lib = BuiltIn().get_library_instance('SeleniumLibrary')

    try:
        # Fill Customer Fields
        selenium_lib.input_text(ADDCUSTOMER_EMAIL_TEXTBOX, email)
        selenium_lib.input_text(ADDCUSTOMER_FIRST_NAME_TEXTBOX, first_name)
        selenium_lib.input_text(ADDCUSTOMER_LAST_NAME_TEXTBOX, last_name)
        selenium_lib.input_text(ADDCUSTOMER_CITY_TEXTBOX, city)
        selenium_lib.select_from_list_by_value(ADDCUSTOMER_STATE_DROPDOWN, state)
        selenium_lib.select_radio_button(ADDCUSTOMER_GENDER_RADIO, gender)
        selenium_lib.select_checkbox(ADDCUSTOMER_PROMO_CHECKBOX)
        selenium_lib.capture_page_screenshot()

        # Click Submit Button
        selenium_lib.click_button(ADDCUSTOMER_SUBMIT_BUTTON)

        # Capture a screenshot after successful submission
        selenium_lib.capture_page_screenshot()

    except Exception as e:
        # Handle any exceptions that might occur
        print(f"An error occurred: {str(e)}")


def generate_new_customer():
    url = 'https://randomuser.me/api/?nat=us'
    response = requests.get(url)

    if response.status_code == 200:
        data = response.json()
        print(data)
        return data
    else:
        return print(f"Failed to retrieve data. Status code: {response.status_code}")


def get_state_key(state_name):
    state_name = state_name.title()  # Ensure the input is in title case (e.g., 'new york' -> 'New York')

    for key, value in states.items():
        if value == state_name:
            return key

    return None
