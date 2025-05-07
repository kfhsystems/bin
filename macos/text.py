#!/opt/local/bin/python3
import sys
import speech_recognition as sr

if len(sys.argv) >1 :
    file_name = sys.argv[1]
else:
    print(f'Please give an audio file name here!')

def main():
    r = sr.Reconizer()

    with sr.AudioFile(file_name) as audio_source:
        r.adjust_for_ambient_noise(audio_source)
        print(f'Converting the sound....')
        audio = r.listen(source)

        try:
            print(f'Converted Audio: {r.recognize_google(audio)}')
        except Exception as e:
            print(e)
