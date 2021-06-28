"""
To experiment with this code freely you will have to run this code locally.
Take a look at the main() function for an example of how to use the code. We
have provided example json output in the other code editor tabs for you to look
at, but you will not be able to run any queries through our UI.
"""
import json
import requests
import pprint

BASE_URL = "http://musicbrainz.org/ws/2/"
ARTIST_URL = BASE_URL + "artist/"


# query parameters are given to the requests.get function as a dictionary; this
# variable contains some starter parameters.
query_type = {  "simple": {},
                "atr": {"inc": "aliases+tags+ratings"},
                "aliases": {"inc": "aliases"},
                "releases": {"inc": "releases"}}


def query_site(url, params, uid="", fmt="json"):
    
    """
    This is the main function for making queries to the musicbrainz API. The
    query should return a json document.
    """
    
    params["fmt"] = fmt
    
    r = requests.get(url + uid, params=params)
    print("Requesting : \n")
    print(r.url)
    print()
    
    
    if r.status_code == requests.codes.ok:
        return r.json()
    else:
        r.raise_for_status()


def query_by_name(url, params, name):
    """
    This adds an artist name to the query parameters before making an API call
    to the function above.
    """
  
    params["query"] = "artist:" + name
    
    return query_site(url, params)


def pretty_print(data, indent=4):
    """
    After we get our output, we can use this function to format it to be more
    readable.
    """
    if type(data) == dict:
        print(json.dumps(data, indent=indent, sort_keys=True))
    else:
        print(data)


def main():
    """
    Below is an example investigation to help you get started in your
    exploration. Modify the function calls and indexing below to answer the
    questions on the next quiz.

    HINT: Note how the output we get from the site is a multi-level JSON
    document, so try making print statements to step through the structure one
    level at a time or copy the output to a separate output file. Experimenting
    and iteration will be key to understand the structure of the data!
    """
   
    #Q1
    
    print("\nQ1 Request Query\n")
    print('----------------\n')
    q1_results = query_by_name(ARTIST_URL, query_type["simple"], "FIRST AID KIT")
      
    artists = q1_results['artists']
    
    count = 0
    for artist in artists:
        if artist['name'].upper() == 'FIRST AID KIT':
            count += 1
    print(f"There are {count} bands named \"FIRST AID KIT\"\n") #2 
    print('----------------\n')
    
    #Q2
    
    print('Q2 can have two interpretations :\n')
    print('Interpretation 1 : Queen as a band that is a group of singers\n')
    print('Interpretation 2 : Queen as a singer\n')
    print("Q2 Request Query\n")
    print('----------------\n')
    q2_results = query_by_name(ARTIST_URL, query_type["simple"], "QUEEN")
       
    artists = q2_results['artists']
    for artist in artists:
        if artist['name'].lower() == 'queen':
            if artist.get('begin-area') and artist['type'].lower() == 'group' :
                print('Interpretation 1: Queen band began in {}'.format(artist['begin-area'].get('name')))
            elif artist.get('begin-area') and artist['type'].lower() == 'person' :    
                print('Interpretation 2: Queen singer began in {}'.format(artist['begin-area'].get('name')))
    
    print('----------------\n')
    #Q3
    
    print("Q3 Request Query\n")
    print('----------------\n')
    q3_results = query_by_name(ARTIST_URL, query_type["aliases"], "BEATLES")
    artists = q3_results['artists']

    for artist in artists:
        if artist.get('aliases'):
            for alias in artist.get('aliases'):
                if alias['locale'] == 'es':
                    print('Spanish Alias for Beatles is {}\n'.format(alias['name']))
    print('----------------\n')
    
    #Q4
    
    print()
    print("Q4 Request Query\n")
    print('----------------\n')
    
    q4_results = query_by_name(ARTIST_URL, query_type["simple"], "NIRVANA")
    artists = q4_results['artists']
    
    for artist in artists:
        if artist['name'].upper() == 'NIRVANA':
            if artist.get('tags'):
                for tag in artist['tags']:
                    if tag['name'].lower() == 'kurt cobain':
                        print('\nFor the Nirvana band with front man as Kurt Cobain, Nirvana Disambiguation is {}\n'.format(artist.get('disambiguation')))
                        break
    print('----------------\n')
    
    #Q5
    
    print()
    print("Q5 Request Query\n")
    print('----------------\n')
    
    q5_results = query_by_name(ARTIST_URL, query_type["simple"], "ONE DIRECTION")
    
    artists = q5_results['artists']
    
    for artist in artists:
        if artist['name'].upper() == 'ONE DIRECTION':
            if artist['life-span']:
                print("One Direction was formed in {}\n".format(artist['life-span'].get('begin').split("-")[0]))
    
    print('---Thank You, Bye!-------------\n')
    
if __name__ == '__main__':
    main()