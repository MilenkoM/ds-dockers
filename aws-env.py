#!/usr/bin/env python
from __future__ import print_function
try:
    import configparser
except ImportError:
    import ConfigParser as configparser
import argparse
import os

parser = argparse.ArgumentParser('AWS environment')
parser.add_argument('-c', '--common', dest='common', default='default')
parser.add_argument('-r', '--credentials', dest='credentials', default='default')
parser.add_argument('-i', '--instance', dest='instance', default='default')
args = parser.parse_args()

AWSCONFIG = os.path.join(os.path.expanduser('~'), '.aws')

common = configparser.ConfigParser()
common.readfp(open(os.path.join(AWSCONFIG, 'config')))

credentials = configparser.ConfigParser()
credentials.readfp(open(os.path.join(AWSCONFIG, 'credentials')))

instances = configparser.ConfigParser()
instances.readfp(open(os.path.join(AWSCONFIG, 'instances')))

resulting = dict()
resulting.update(dict(common.items('common')))
resulting.update(dict(common.items(args.common)))
resulting.update(dict(instances.items('common')))
resulting.update(dict(instances.items(args.instance)))
resulting.update(dict(credentials.items('common')))
resulting.update(dict(credentials.items(args.credentials)))

print('\n'.join('export ' + k.upper() + '=' + v for k, v in resulting.items()))
