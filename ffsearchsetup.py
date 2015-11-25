#!/usr/bin/env python
import logging
import os
import glob
import json
import shutil
# TODO: use appdirs module


def pjson(thing_to_dump):
    return json.dumps(thing_to_dump, indent=2)


def logging_setup(loggername, loglevel=logging.DEBUG):
    log = logging.getLogger(loggername)
    log.propagate = False
    log.setLevel(loglevel)
    formatter = logging.Formatter(
        fmt='[%(asctime)s] %(levelname)s [%(name)s:%(lineno)s] %(message)s',
        datefmt='%Y-%m-%d %H:%M:%S')
    handler = logging.StreamHandler()
    handler.setFormatter(formatter)
    log.addHandler(handler)
    return log


def firefox_config(log):
    firefox_dir = os.path.expanduser('~/Library/Application Support/Firefox')
    profiles_dir = os.path.join(firefox_dir, 'Profiles')
    log.info('profiles dir = %s' % profiles_dir)
    profiles = glob.glob(os.path.join(profiles_dir, '*.default'))
    log.info(profiles)
    if len(profiles) > 1:
        raise ValueError('too many default profiles found!')
    default_profile = os.path.join(profiles_dir, profiles[0])
    log.info(default_profile)

    search_meta = os.path.join(default_profile, 'search-metadata.json')
    metabackup = '{0}.original'.format(search_meta)
    if not os.path.isfile(metabackup):
        log.info('writing search metadata file backup')
        shutil.copy2(search_meta, metabackup)

    search = os.path.join(default_profile, 'search.json')
    searchbackup = '{0}.original'.format(search)
    if not os.path.isfile(searchbackup):
        log.info('writing search file backup')
        shutil.copy2(search, searchbackup)

    try:
        metajson = None
        with open(search_meta, 'rb') as meta:
            metajson = json.loads(meta.read())
            log.debug(pjson(metajson))
            for key, data in metajson.iteritems():
                if 'hidden' in data:
                    data['hidden'] = True
                if 'global' in key:
                    data['current'] = "Google"
                    data['searchdefault'] = "Google"
                    if 'hash' in data:
                        del data['hash']
                    if 'searchdefaulthash' in data:
                        del data['searchdefaulthash']
                    if 'searchdefaultexpir' in data:
                        del data['searchdefaultexpir']
        if metajson is None:
            raise ValueError('metajson is None')
        with open(search_meta, 'wb') as meta:
            log.debug(pjson(metajson))
            meta.write(json.dumps(metajson))
    except Exception as e:
        log.error(e)

    try:
        searchjson = None
        with open(search, 'rb') as fsearch:
            searchjson = json.loads(fsearch.read())
            log.debug(pjson(searchjson.keys()))
            log.debug(pjson(searchjson['directories'].items()[0][1].keys()))
            log.debug(pjson(searchjson['visibleDefaultEngines']))
        if searchjson is None:
            raise ValueError('searchjson is None')

        engines = searchjson['directories'].items()[0][1]['engines']
        for engine in engines:
            isgoogle = True
            if 'Google' not in engine['_name']:
                isgoogle = False
            if 'Google' not in engine['description']:
                isgoogle = False
            if isgoogle:
                engine['_hidden'] = False
            else:
                engine['_hidden'] = True
            engineinfo = '{name} ({eid}) [{hidden}]'
            log.info(engineinfo.format(
                name=engine['_name'],
                eid=engine['_id'],
                hidden=engine['_hidden']))

        searchjson['visibleDefaultEngines'] = ("google",)
        log.info(pjson(searchjson['visibleDefaultEngines']))

        with open(search, 'wb') as fsearch:
            fsearch.write(json.dumps(searchjson))
    except Exception as e:
        log.error(e)


if __name__ == '__main__':
    firefox_config(logging_setup('firefox_config', logging.INFO))
