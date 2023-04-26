import argparse


def SayHello(name):
    print("Hello ", name)
    return name


if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--name', help='name to greet')
    args = parser.parse_args()
    SayHello(args.name)

