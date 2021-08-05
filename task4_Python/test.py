import argparse

parser=argparse.ArgumentParser(
    description='''My Description. And what a lovely description it is. ''',
    epilog="""All is well that ends well.""")

parser.add_argument('--foo', type=int, default=42, help='FOO!')

parser.add_option("-f1", "--file1", dest="filename",
                  help="write report to FILE", metavar="FILE")

parser.add_option("-f2", "--file2", dest="filename",
                  help="write report to FILE ", metavar="FILE")
parser.add_argument('bar', nargs='*', default=[1, 2, 3], help='BAR!')
args=parser.parse_args()

