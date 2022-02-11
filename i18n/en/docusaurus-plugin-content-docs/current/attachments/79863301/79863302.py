#!/usr/bin/python
# Before running this you need to:
# aptitude install python-suds
from suds import WebFault
from suds.client import Client
import sys

def usage():
  print "Uage : " + sys.argv[0] + " domain.tld" 
  sys.exit(0)

def updateUserFilter(domain):

  uq = c.factory.create('userQuery')
  uq.domainId = domain.id
  uq.system = 0
  uq.archived = False
  users = c.service.findUsers(token, uq)
  

  for user in users:
    print "Updating filter for : " + user.login
    filters=c.service.getEntityFilters(token, "user", user.id)
    c.service.setEntityFilters(token, filters, "user", user.id)

def updateMailshareFilter(domain):
  mq = c.factory.create('mailshareQuery')
  mq.domainId = domain.id
  mq.system = 0
  mailshares = c.service.findMailshares(token, mq)

  for mailshare in mailshares:
    print "Updating filter for : " + mailshare.name
    filters=c.service.getEntityFilters(token, "mailshare", mailshare.id)
    c.service.setEntityFilters(token, filters, "mailshare", mailshare.id)

def updateDomainFilter(domain):
  print "Update domain filters "
  filters=c.service.getEntityFilters(token, "domain", domain.id)
  c.service.setEntityFilters(token, filters, "domain", domain.id)



if len(sys.argv) != 2:
  usage()

domainName=sys.argv[1]

url = 'https://localhost/soap/proxy?wsdl'
login = 'admin0@global.virt'

f = open('/etc/bm/bm-core.tok', 'r')
password = f.readline()
f.close()


try:
  c = Client(url, cache=None)
  token = c.service.login(login, password, 'updateMailboxFilters')

  dq = c.factory.create('domainQuery')
  dq.name=domainName
  domain = c.service.findDomains(token,dq)

  updateUserFilter(domain[0])
  updateMailshareFilter(domain[0])
  updateDomainFilter(domain[0])

except Exception, e:
  print e
